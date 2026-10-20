using System;using System.Reflection;
var a=Assembly.LoadFrom(args[0]);
var t=a.GetType("Encrypter.Goodies.Engine");
var o=Activator.CreateInstance(t,true);
var m=t.GetMethod("pump");
int n=int.Parse(args[2]);
for(int i=0;i<n;i++) Console.WriteLine(m.Invoke(o,new object[]{args[1],args[3]=="1"}));
