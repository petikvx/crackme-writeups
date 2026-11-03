using System; using System.Reflection; using System.Windows.Forms; using System.Runtime.Serialization;
class H { static void Main(string[] a){
 var asm = Assembly.LoadFrom(a[0]); var t = asm.GetType("KeyWizard.Form1");
 var f = FormatterServices.GetUninitializedObject(t);
 var bf = BindingFlags.NonPublic|BindingFlags.Public|BindingFlags.Instance|BindingFlags.Static;
 foreach (var n in new[]{"_TextBox1","_TextBox2"}) { var fi=t.GetField(n,bf); var tb=new TextBox(); tb.Text = n=="_TextBox1"?a[1]:a[2]; fi.SetValue(f,tb);} 
 try { t.GetMethod("Button1_Click",bf).Invoke(f,new object[]{null,EventArgs.Empty}); } catch(Exception e){ Console.WriteLine("dlg: "+e.InnerException?.GetType().Name); }
 Console.WriteLine("wstr=" + t.GetField("wstr",bf).GetValue(f));
}}
