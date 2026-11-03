using System;using System.Reflection;
class P{static void Main(string[] a){
 var asm=Assembly.LoadFrom(a[0]);
 var m1=asm.GetType("Crackme.Module1");var m2=asm.GetType("Crackme.Module2");
 BF f=null;
 Func<string,string> v7=s=>{
  object t=m1.GetMethod("var").Invoke(null,new object[]{s});
  t=m1.GetMethod("var1").Invoke(null,new object[]{(string)t});
  t=m1.GetMethod("var2").Invoke(null,new object[]{(string)t});
  t=m2.GetMethod("var6").Invoke(null,new object[]{(string)t});
  return (string)m2.GetMethod("var10").Invoke(null,new object[]{(string)t});};
 long num=long.Parse((string)m2.GetMethod("var5").Invoke(null,null));
 long num2=long.Parse(v7(a[1].ToUpper()));
 Console.WriteLine(num*6+(long)Math.Round(num2/3.0));
}}
class BF{}
