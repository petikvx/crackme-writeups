using Microsoft.VisualBasic.CompilerServices;
string n=args[0], s=args[1];
string text = Conversions.ToString(n.Length);
string text2 = Conversions.ToString(Conversions.ToDouble(text) * 81.0 + 19350.0);
System.Console.WriteLine(Operators.CompareString(s, text2, false) == 0 ? "Good Way!" : "Not right! ("+text2+")");
