using Microsoft.VisualBasic.CompilerServices;
using System.Globalization;
foreach (var name in new[]{"petik","a"}) {
  object obj = 0;
  for (int i = 0; i <= 10000; i++) {
    obj = (i % 100 == 0) ? Operators.AddObject(obj, 1) : Operators.AddObject(Operators.MultiplyObject(obj, 9), name.Length);
    if (i < 40 || i==400) System.Console.WriteLine($"{i} {obj.GetType().Name} {obj}");
  }
  object r = Operators.AddObject(obj, name.Length);
  System.Console.WriteLine($"{name}: type={r.GetType().Name} cur='{r}' inv='{((double)r).ToString(CultureInfo.InvariantCulture)}' fr='{((double)r).ToString(new CultureInfo("fr-FR"))}'");
}
