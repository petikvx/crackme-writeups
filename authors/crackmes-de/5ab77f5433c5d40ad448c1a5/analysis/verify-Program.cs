using System; using System.Text; using System.Security.Cryptography; using Microsoft.VisualBasic.CompilerServices;
string A(string s){var b=new UnicodeEncoding().GetBytes(s);var h=MD5.Create().ComputeHash(b);return Convert.ToBase64String(h);}
string B(string s){var x=A(s);return x+x+x;}
string n=args[0], ser=args[1];
var h1=A(n); var x1=A(h1)+B(n); var b2=A(B(x1)); var r=B(A(B(A(b2+x1+h1))));
Console.WriteLine(Operators.CompareString(ser,r,false)==0?"Great Work!!Now write a tut!":"Wrong try again!! expected "+r);
