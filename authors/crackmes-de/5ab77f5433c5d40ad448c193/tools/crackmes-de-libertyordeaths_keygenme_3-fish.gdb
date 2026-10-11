set pagination off
set debuginfod enabled off
b *0x804872a
commands
silent
set $eax=0
c
end
b *0x804875a
commands
silent
x/s *(char**)$esp
x/s *(char**)($esp+4)
p *(int*)($esp+8)
c
end
run < in.txt
