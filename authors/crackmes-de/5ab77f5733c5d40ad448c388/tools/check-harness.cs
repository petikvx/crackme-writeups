// Harness : charge le SpaghettiMe.exe d'origine par reflexion, remplit txtName/txtKey
// et appelle la methode privee overloaded() (le predicat reel). Usage: harness.exe <exe> <name> <key>
using System; using System.Reflection; using System.Windows.Forms;
class H {
  [STAThread] static int Main(string[] a) {
    Assembly asm = Assembly.LoadFrom(a[0]);
    Type t = asm.GetType("spaghettime.mainForm");
    BindingFlags f = BindingFlags.NonPublic | BindingFlags.Public | BindingFlags.Instance;
    object form = Activator.CreateInstance(t);
    ((TextBox)t.GetField("txtName", f).GetValue(form)).Text = a[1];
    ((TextBox)t.GetField("txtKey", f).GetValue(form)).Text = a[2];
    MethodInfo m = t.GetMethod("overloaded", f, null, Type.EmptyTypes, null);
    MethodInfo ms = t.GetMethod("overloaded", f, null, new Type[]{typeof(string)}, null);
    Console.WriteLine("hash=" + a[1].GetHashCode() + " nameval=" + ms.Invoke(form, new object[]{a[1]}));
    bool ok = a[2].Length == 40 && a[1] != "" && (bool)m.Invoke(form, null);
    Console.WriteLine(ok ? "VALID" : "INVALID");
    return ok ? 0 : 1;
  }
}
