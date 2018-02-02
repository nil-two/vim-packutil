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

function! s:helptags_one(doc_path) abort
  if filewritable(a:doc_path) == 2 && empty(glob(a:doc_path . '/tags*'))
    execute 'helptags' a:doc_path
  endif
endfunction

function! packutil#helptags(names) abort
  for name in a:names
    let doc_path_glob = 'pack/*/*/' . fnameescape(name) . '/doc'
    let doc_pathes    = split(globpath(&rtp, doc_path_glob), '\n')
    for doc_path in doc_pathes
      call s:helptags_one(doc_path)
    endfor
  endfor
endfunction

function! packutil#helptags_all() abort
  let doc_path_glob = 'pack/*/*/*/doc'
  let doc_pathes    = split(globpath(&rtp, doc_path_glob), '\n')
  for doc_path in doc_pathes
    call s:helptags_one(doc_path)
  endfor
endfunction
