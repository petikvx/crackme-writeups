using Microsoft.VisualBasic;
class P { static void Main(string[] a){ string s=""; int n=Strings.Len(a[0]);
 for(int i=1;i<=n;i++) s+=Conversion.Hex(Strings.Asc(Strings.Mid(a[0],i,1)));
 string r=""; for(int i=Strings.Len(s);i>=1;i--) r+=Strings.Mid(s,i,1);
 System.Console.WriteLine(r);}}
