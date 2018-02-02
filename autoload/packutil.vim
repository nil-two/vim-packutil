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

function! packutil#helptags(names) abort
  for name in a:names
    let doc_path_glob = 'pack/*/*/' . fnameescape(name) . '/doc'
    let doc_pathes    = split(globpath(&rtp, doc_path_glob), '\n')
    for doc_path in doc_pathes
      if filewritable(doc_path) == 2 && empty(glob(doc_path . '/tags*'))
        execute 'helptags' doc_path
      endif
    endfor
  endfor
endfunction

function! packutil#helptags_all() abort
  let doc_path_glob = 'pack/*/*/*/doc'
  let doc_pathes    = split(globpath(&rtp, doc_path_glob), '\n')
  for doc_path in doc_pathes
    if filewritable(doc_path) == 2 && empty(glob(doc_path . '/tags*'))
      execute 'helptags' doc_path
    endif
  endfor
endfunction
