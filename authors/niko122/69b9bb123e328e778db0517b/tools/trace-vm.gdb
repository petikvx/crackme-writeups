set pagination off
set confirm off
hbreak *0x140004731
commands 1
silent
printf "DISP idx=%d table=%lx rcx=%lx\n", $rax, $rdx, $rcx
continue
end
hbreak *0x140004a62
commands 2
silent
printf "F %02x\n", $al
continue
end
continue
