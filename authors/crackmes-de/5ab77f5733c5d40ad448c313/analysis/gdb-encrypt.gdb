set pagination off
break *0x402874
commands
silent
printf "i=%d ax=%d\n", $bl, $ax
continue
end
break *0x4028ac
commands
silent
x/ws *(int*)($ebp-0x18)
x/ws *(int*)($ebp-0x20)
continue
end
continue
