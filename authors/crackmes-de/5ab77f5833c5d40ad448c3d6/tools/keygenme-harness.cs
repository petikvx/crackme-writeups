using System; using System.Reflection; using System.Windows.Forms;
class H{ static void Main(string[] a){
 var asm=Assembly.LoadFrom(a[0]);
 var t=asm.GetType("KeygenMe.Form1");
 Console.WriteLine("CLR "+Environment.Version);
 for(int i=1;i+1<a.Length;i+=2){
  var f=(Form)Activator.CreateInstance(t);
  Func<string,TextBox> tb=n=>(TextBox)t.GetProperty(n,BindingFlags.NonPublic|BindingFlags.Public|BindingFlags.Instance).GetValue(f,null);
  tb("TextBox1").Text=a[i]; tb("TextBox2").Text=a[i+1];
  var r=t.GetMethod("var3",BindingFlags.NonPublic|BindingFlags.Instance).Invoke(f,null);
  Console.WriteLine(a[i]+" / "+a[i+1]+" -> "+r+"  esp1="+t.GetField("esp1",BindingFlags.NonPublic|BindingFlags.Instance).GetValue(f)+" esp2="+t.GetField("esp2",BindingFlags.NonPublic|BindingFlags.Instance).GetValue(f));
 }}}
