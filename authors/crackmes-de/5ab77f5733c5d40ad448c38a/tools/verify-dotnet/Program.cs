// Rejoue btnCheck_Click avec la VRAIE classe _.SuperString chargée depuis l'exe d'origine.
// usage: verify <exe> <name> <keyhex> <user>
using System;
using System.Reflection;
var asm = Assembly.LoadFrom(args[0]);
var t = asm.GetType("_.SuperString");
object New(params object[] a) => Activator.CreateInstance(t, a);
object name = New(args[1]);
object key = New(args[2]);
t.GetMethod("expand").Invoke(key, null);
object upper = New(name); // copie -> ToUpper
object user = New(args[3]);
object exp = t.GetMethod("op_Addition").Invoke(null, new[] { upper, user });
bool eq = (bool)t.GetMethod("Equals", new[] { t }).Invoke(exp, new[] { key });
Console.WriteLine($"expected={exp} equal={eq} len={args[1].Length}");
