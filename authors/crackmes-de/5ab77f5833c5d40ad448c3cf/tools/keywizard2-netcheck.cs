// Recopie exacte de Form1.Encrypt (KeyWizard 2) avec le runtime .NET (Rfc2898DeriveBytes, Rijndael, CryptoStream)
using System;using System.IO;using System.Security.Cryptography;using System.Text;
class P{
static byte[] Salt={100,86,34,53,11,224,145,123,237,213,12,124,45,65,71,127,135,165,234,164,127,234,231,211,10,9,114,234,44,63,75,12};
static string Encrypt(string Data,string Password){
 var r=new Rfc2898DeriveBytes(Password,Salt);
 var rj=Aes.Create(); rj.Key=r.GetBytes(32); rj.IV=r.GetBytes(16);
 var ms=new MemoryStream(); var cs=new CryptoStream(ms,rj.CreateEncryptor(),CryptoStreamMode.Write);
 cs.Write(Encoding.Default.GetBytes(Data),0,Data.Length); cs.Close(); ms.Close();
 return Convert.ToBase64String(ms.ToArray());}
static void Main(string[] a){foreach(var s in a)Console.WriteLine(s+" -> "+Encrypt(s,s));}}
