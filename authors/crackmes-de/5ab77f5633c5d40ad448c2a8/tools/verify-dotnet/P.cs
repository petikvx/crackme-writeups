using System;using System.IO;using System.Reflection;using System.Security.Cryptography;using System.Text;
class P{
 // Copie fidèle de DecryptString128Bit (assembly interne décompilé)
 static string Dec(string s,string k){byte[] iv={121,241,10,1,132,74,11,39,255,91,45,78,14,211,22,62};
  var r=new RijndaelManaged();byte[] a=Convert.FromBase64String(s);
  k = k.Length>=32? k.Substring(0,32) : k+new string('X',32-k.Length);
  byte[] b=Encoding.ASCII.GetBytes(k.ToCharArray());byte[] o=new byte[a.Length+1];
  var ms=new MemoryStream(a);try{var cs=new CryptoStream(ms,r.CreateDecryptor(b,iv),CryptoStreamMode.Read);int n=0,t;while((t=cs.Read(o,n,o.Length-n))>0)n+=t;}catch(Exception e){}
  return Encoding.ASCII.GetString(o).Replace("\0","");}
 static void Main(string[] a){
  Console.WriteLine("copie: "+(Dec(a[2],a[1])==a[0]?"The serial is correct!":"Serial is incorrect"));
  try{var asm=Assembly.LoadFrom(a[3]);var t=asm.GetType("Form1")??Array.Find(asm.GetTypes(),x=>x.GetMethod("DecryptString128Bit")!=null);
   var obj=System.Runtime.CompilerServices.RuntimeHelpers.GetUninitializedObject(t);
   var r=(string)t.GetMethod("DecryptString128Bit").Invoke(obj,new object[]{a[2],a[1]});
   Console.WriteLine("IL original: '"+r+"' -> "+(string.CompareOrdinal(r,a[0])==0?"The serial is correct!":"Serial is incorrect"));}
  catch(Exception e){Console.WriteLine("reflexion KO: "+e.GetType().Name+": "+e.Message.Split('\n')[0]);}
 }}
