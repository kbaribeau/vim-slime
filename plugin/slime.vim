function Send_to_Screen(text)
  let b:slime = {"sessionname": "slime", "windowname": "0"}

  let escaped_text = substitute(shellescape(a:text), "\\\\\n", "\n", "g")
  call system("screen -S slime -p 0 -X stuff " . escaped_text)
endfunction

function Screen_Session_Names(A,L,P)
  return system("screen -ls | awk '/Attached/ {print $1}'")
endfunction

vmap <C-c><C-c> "ry:call Send_to_Screen(@r)<CR>
nmap <C-c><C-c> vip<C-c><C-c>

