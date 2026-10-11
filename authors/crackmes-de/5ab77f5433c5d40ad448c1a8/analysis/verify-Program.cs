var asm = System.Reflection.Assembly.LoadFrom("/tmp/c4/Game/Crypto.dll");
var t = asm.GetType("Crypto.Crypto"); var o = System.Activator.CreateInstance(t);
var txt = (string)t.GetMethod("DecryptText").Invoke(o, new object[]{"0JcT5U3uSlmaNmEJnzPg+/OL2z5RngZt0UJGUiyvF/HHz7wbKlKp+cUFzLrQOLgi"});
string cid = string.Join("-", args);
System.Console.WriteLine(txt == cid ? "MATCH: RunTime.Enter écrirait et lancerait Replay.exe" : "no match ("+txt+")");
