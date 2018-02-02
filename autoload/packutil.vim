function! packutil#packadd(names) abort
  for name in a:names
    execute 'packadd!' name
  endfor
endfunction

function! packutil#packadd_force(names) abort
  for name in a:names
    try 
      execute 'packadd!' name
    catch
    endtry
  endfor
endfunction
