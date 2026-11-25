using Mono.Cecil;using Mono.Cecil.Cil;using System.Linq;
var m=ModuleDefinition.ReadModule(args[0]);
var md=m.GetType("AvmF3594EC7","XRBAXIFCLQGHN").Methods.First(x=>x.Name=="CP8B70U93ABO");
var il=md.Body.GetILProcessor();
var wl=m.ImportReference(typeof(System.Console).GetMethod("Write",new[]{typeof(string)}));
var wc=m.ImportReference(typeof(System.Console).GetMethod("Write",new[]{typeof(char)}));
var ins=md.Body.Instructions;
var calls=ins.Where(i=>i.OpCode==OpCodes.Call||i.OpCode==OpCodes.Callvirt).Where(i=>((MethodReference)i.Operand).Name=="B29Y44MW2T").ToList();
var v=calls.Select(c=>c.Previous.Operand as VariableDefinition).ToList();
var last=calls[1].Next; // stloc flag2
var at=last.Next;
il.InsertBefore(at,il.Create(OpCodes.Ldstr,"\u0001A:")); il.InsertBefore(at,il.Create(OpCodes.Call,wl));
il.InsertBefore(at,il.Create(OpCodes.Ldloc,v[0])); il.InsertBefore(at,il.Create(OpCodes.Call,wc));
il.InsertBefore(at,il.Create(OpCodes.Ldstr,"B:")); il.InsertBefore(at,il.Create(OpCodes.Call,wl));
il.InsertBefore(at,il.Create(OpCodes.Ldloc,v[1])); il.InsertBefore(at,il.Create(OpCodes.Call,wc));
il.InsertBefore(at,il.Create(OpCodes.Ldstr,"\n")); il.InsertBefore(at,il.Create(OpCodes.Call,wl));
m.Write(args[1]);
