// Réf. : Button1_Click de KeygenMe.exe recopié tel quel (ilspycmd) avec le vrai runtime VB
// (Microsoft.VisualBasic.Strings/Conversion). Usage : vbref <ComputerName> <name> <s1> <s2> <s3> <s4>
using Microsoft.VisualBasic;
class P {
  static void Main(string[] a) {
    string text = a[0]; string t1 = a[1];
    int num = Strings.Len(text);
    string text2 = null, text3 = null, text5 = null, text7 = null, text10 = null, text12 = null, text14 = null, text15 = null;
    checked {
      for (int i = 1; i <= num; i++) {
        text2 = text2 + "" + Conversion.Hex(Strings.Asc(Strings.Mid(text, i, 1)));
        text3 = Strings.Mid(text2, 1, 5);
        string text4 = t1; int num2 = Strings.Len(text4);
        for (int j = 1; j <= num2; j++) {
          text5 = text5 + "" + Conversion.Hex(Strings.Asc(Strings.Mid(text4, j, 1)));
          string text6 = Strings.StrReverse(text5);
          text7 = Strings.Mid(text6, 3, 10);
          string text8 = Strings.StrReverse(text); string text9 = Strings.StrReverse(text4);
          text10 = text10 + "" + Conversion.Hex(Strings.Asc(Strings.Mid(text8, i, 1)));
          string text11 = Strings.Mid(text10, 1, 5);
          text12 = text12 + "" + Conversion.Hex(Strings.Asc(Strings.Mid(text9, j, 1)));
          string text13 = Strings.Mid(text12, 5, 5);
          text14 = text13 + text11;
          text15 = Convert.ToString(Conversion.Int((double)(Conversion.Int(t1.Length) * 68 + 401016)));
        }
      }
    }
    bool bad = a[2] != text3 || a[3] != text7 || a[4] != text14 || a[5] != text15;
    Console.Error.WriteLine($"{text3} {text7} {text14} {text15}"); Console.WriteLine(bad ? "Essaye encore :|" : "Bravo :)!!!");
  }
}
