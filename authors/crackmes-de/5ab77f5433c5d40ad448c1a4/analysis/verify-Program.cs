using Microsoft.VisualBasic; using Microsoft.VisualBasic.CompilerServices;
string n=args[0], s=args[1];
string text = checked(Conversions.ToString(n.Length * 85) + "-" + Strings.StrReverse(Strings.Mid(n, 2, 3)) + "ata-" + Conversions.ToString(100 + 80 * n.Length));
System.Console.WriteLine(Operators.CompareString(s, text, false) == 0 ? "Right Password!" : "Wrong Password! ("+text+")");
