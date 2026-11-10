using System;using System.Reflection;
class P{static void Main(string[] a){
var asm=Assembly.LoadFrom("/tmp/st/x/CrackMe/win-framework/CrackMe.dll");
var rt=asm.GetType("ThemidaPlus.Runtime");
var l=rt.GetMethod("LoadEncString");
for(int t=1879048193;t<=1879048210;t++){Console.WriteLine(t+" "+(string)l.Invoke(null,new object[]{t}));}
var pr=asm.GetType("CrackMe.Program");
var d=pr.GetMethod("DecryptExpectedPassword",BindingFlags.NonPublic|BindingFlags.Static);
Console.WriteLine(BitConverter.ToString((byte[])d.Invoke(null,null)));
foreach(var s in a){var r=rt.GetMethod("Dispatch").Invoke(null,new object[]{76,new object[]{s}});Console.WriteLine(s+" -> "+r);}
}}
