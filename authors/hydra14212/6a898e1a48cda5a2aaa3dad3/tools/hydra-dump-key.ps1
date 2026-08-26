# HydraVault dump KEY (Admin). Fresh vault only (fail=0). Type FAST.
#   Set-ExecutionPolicy -Scope Process Bypass
#   .\hydra-dump-key.ps1 -Challenge 4F773DB94CC35512
# Optional: -SendType  (types best key into foreground window after 2s)

param(
    [Parameter(Mandatory = $true)][string]$Challenge,
    [int]$ProcessId = 0,
    [switch]$SendType
)

$ErrorActionPreference = 'Stop'
$chal = ($Challenge -replace '\s', '').ToUpper()
if ($chal.Length -ne 16) { throw "CHALLENGE must be 16 hex chars" }
$marker = New-Object byte[] 8
for ($i = 0; $i -lt 8; $i++) {
    $marker[$i] = [Convert]::ToByte($chal.Substring($i * 2, 2), 16)
}

Add-Type @"
using System;
using System.Runtime.InteropServices;
public class HV {
  [DllImport("kernel32.dll", SetLastError=true)] public static extern IntPtr OpenProcess(uint a, bool b, int p);
  [DllImport("kernel32.dll", SetLastError=true)] public static extern bool ReadProcessMemory(IntPtr h, IntPtr a, byte[] b, int s, out int r);
  [DllImport("kernel32.dll", SetLastError=true)] public static extern int VirtualQueryEx(IntPtr h, IntPtr a, out MBI m, int l);
  [DllImport("kernel32.dll")] public static extern bool CloseHandle(IntPtr h);
  [StructLayout(LayoutKind.Sequential)] public struct MBI {
    public IntPtr BaseAddress, AllocationBase; public uint AllocationProtect, __pad;
    public UIntPtr RegionSize; public uint State, Protect, Type;
  }
}
"@

if ($ProcessId -le 0) {
    $procs = @(Get-Process | Where-Object {
        $_.ProcessName -like 'hv*' -and $_.ProcessName -ne 'HydraVault'
    })
    if ($procs.Count -lt 1) { throw "No hv*.exe - start vault with HYDRA_VAULT_NO_SELFDBG=1 first" }
    $ProcessId = $procs[0].Id
    Write-Host ("[*] PID={0} ({1})" -f $ProcessId, $procs[0].ProcessName)
}

$h = [HV]::OpenProcess(0x410, $false, $ProcessId)
if ($h -eq [IntPtr]::Zero) { throw "OpenProcess failed - run as Admin" }

function Hex([byte[]]$b) { -join ($b | ForEach-Object { $_.ToString('X2') }) }

$cands = @()
$addr = [IntPtr]0x10000
$mbi = New-Object HV+MBI
while ([int64]$addr -lt 0x7FFFFFFF0000) {
    if ([HV]::VirtualQueryEx($h, $addr, [ref]$mbi, [Runtime.InteropServices.Marshal]::SizeOf($mbi)) -eq 0) { break }
    $rs = [uint64]$mbi.RegionSize
    $prot = $mbi.Protect
    $ok = ($mbi.State -eq 0x1000) -and (@(0x04, 0x20, 0x40) -contains ($prot -band 0xFF))
    if ($ok -and $rs -gt 0 -and $rs -le 0x8000000) {
        $buf = New-Object byte[] ([Math]::Min([int]$rs, 0x8000000))
        $read = 0
        if ([HV]::ReadProcessMemory($h, $mbi.BaseAddress, $buf, $buf.Length, [ref]$read) -and $read -gt 40) {
            for ($i = 0; $i -le ($read - 40); $i++) {
                $match = $true
                for ($j = 0; $j -lt 8; $j++) {
                    if ($buf[$i + $j] -ne $marker[$j]) { $match = $false; break }
                }
                if (-not $match) { continue }
                $ctxFrom = [Math]::Max(0, $i - 8)
                $ctxTo = [Math]::Min($read - 1, $i + 39)
                $ctx = $buf[$ctxFrom..$ctxTo]
                # try several offsets for 16-byte key relative to challenge
                foreach ($off in @(8, 16, 4, 12, 24)) {
                    if (($i + $off + 16) -gt $read) { continue }
                    $key = $buf[($i + $off)..($i + $off + 15)]
                    $nz = @($key | Where-Object { $_ -ne 0 }).Count
                    $uniq = @($key | Select-Object -Unique).Count
                    if ($nz -lt 8) { continue }
                    $score = ($nz * 16) + $uniq
                    # prefer high entropy
                    $score += (@($key | Select-Object -Unique).Count)
                    $va = [int64]$mbi.BaseAddress + $i
                    $cands += [pscustomobject]@{
                        Score = $score
                        Off   = $off
                        Addr  = ('0x{0:X}' -f $va)
                        Key   = (Hex $key)
                        Ctx   = (Hex $ctx)
                    }
                }
            }
        }
    }
    $next = [int64]$mbi.BaseAddress + [int64]$rs
    if ($next -le [int64]$addr) { break }
    $addr = [IntPtr]$next
}
[void][HV]::CloseHandle($h)

if ($cands.Count -lt 1) { throw "No candidates - epoch rotated or wrong challenge" }
$best = @($cands | Sort-Object Score -Descending)
Write-Host ("[*] {0} candidate(s):" -f $best.Count)
$best | Select-Object -First 8 | ForEach-Object {
    Write-Host ("    score={0} off=+{1} {2}" -f $_.Score, $_.Off, $_.Key)
    Write-Host ("      ctx={0}" -f $_.Ctx)
}
$pick = $best[0].Key
Write-Host ""
Write-Host "TYPE THIS KEY (fresh vault fail=0 only):"
Write-Host $pick
Write-Host ""
# also suggest bswap of last 4 bytes (near-miss hint)
$bytes = New-Object byte[] 16
for ($i = 0; $i -lt 16; $i++) { $bytes[$i] = [Convert]::ToByte($pick.Substring($i * 2, 2), 16) }
$alt = $bytes[0..11] + $bytes[15], $bytes[14], $bytes[13], $bytes[12]
Write-Host "ALT last4-bswap (if So close last 4 bytes):"
Write-Host (Hex $alt)
Write-Host ""

if ($SendType) {
    Add-Type -AssemblyName System.Windows.Forms
    Write-Host "Click the HydraVault console NOW - typing in 2 seconds..."
    Start-Sleep -Seconds 2
    [System.Windows.Forms.SendKeys]::SendWait($pick)
    Start-Sleep -Milliseconds 200
    [System.Windows.Forms.SendKeys]::SendWait('{ENTER}')
    Write-Host "Sent."
}
