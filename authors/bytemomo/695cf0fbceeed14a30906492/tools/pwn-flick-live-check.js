const fs=require('fs');
const buf=fs.readFileSync(process.argv[2]);const lic=BigInt(process.argv[3]);
const mod=new WebAssembly.Module(buf);
const imports={};
for(const d of WebAssembly.Module.imports(mod)){imports[d.module]??={};
 if(d.kind==='function')imports[d.module][d.name]=(...a)=>0;
 else if(d.kind==='global'&&d.module==='aegis')imports.aegis[d.name]=new WebAssembly.Global({value:'i64',mutable:false},lic);
 else if(d.kind==='memory')imports[d.module][d.name]=new WebAssembly.Memory({initial:256,maximum:65536});
 else if(d.kind==='table')imports[d.module][d.name]=new WebAssembly.Table({initial:1000,element:'anyfunc'});}
const inst=new WebAssembly.Instance(mod,imports);const e=inst.exports;
const steps=['_start','main_start','main_update','main_update','main_update'];
for(const s of steps){fs.writeSync(1,'call '+s+'\n');try{const r=e[s]&&e[s]();fs.writeSync(1,s+' ok\n');}catch(x){console.log(s,'TRAP',x.message);break;}}
