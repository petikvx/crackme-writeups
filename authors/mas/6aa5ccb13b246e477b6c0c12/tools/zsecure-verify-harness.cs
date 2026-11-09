using System;using System.Reflection;
class P{static void Main(string[] a){
var asm=Assembly.LoadFrom(a[0]);var t=asm.GetType("ZOS.GameState");
object C(string n,params object[] p)=>t.GetMethod(n,BindingFlags.Public|BindingFlags.Static).Invoke(null,p);
object G(string n)=>t.GetProperty(n).GetValue(null);
Console.WriteLine("badkey="+C("ValidateBootKey","AAA-AAA-AAA-AAA"));
Console.WriteLine("boot="+C("ValidateBootKey","K7P-2XM-9Q4-T8V"));
C("RecordPhishing","oday@zsecure.zplus","burger");
t.GetField("PhishingSent").SetValue(null,true);
Console.WriteLine("pc1="+C("ValidatePc1","oday","Aa123456"));
t.GetField("Pc1LoggedIn").SetValue(null,true);
Console.WriteLine("vpn="+C("ValidateVpn","10.10.55.21","4444","ROT13"));
t.GetField("VpnConnected").SetValue(null,true);
Console.WriteLine("pc2="+C("ValidatePc2","mohamad","Aa123456"));
string inp=(string)G("WinAddrToken")+(string)G("OverflowMarker");
Console.WriteLine("input="+inp+" overflow="+C("ValidateOverflow",inp));
Console.WriteLine("FLAG="+G("Flag"));}}
