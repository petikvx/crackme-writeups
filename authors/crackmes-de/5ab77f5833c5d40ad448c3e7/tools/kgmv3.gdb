set pagination off
break *0x403029
commands
silent
echo PRE-EXPECTED:\n
x/hs *(int*)($ebp-0x40)
continue
end
break *0x403082
commands
silent
echo EXPECTED-T:\n
x/hs $eax
echo TYPED-T:\n
x/hs *(int*)($ebp-0x34)
continue
end
continue
