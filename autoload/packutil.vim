function! packutil#packadd(package_name_list) abort
  for package_name in a:package_name_list
    execute 'packadd' package_name
  endfor
endfunction

function! packutil#packadd_force(package_name_list) abort
  for package_name in a:package_name_list
    try 
      execute 'packadd' package_name
    catch
    endtry
  endfor
endfunction

function! s:helptags_one(doc_path) abort
  if filewritable(a:doc_path) == 2 && empty(glob(a:doc_path . '/tags*'))
    execute 'helptags' a:doc_path
  endif
endfunction

function! packutil#helptags(package_name_list) abort
  for package_name in a:package_name_list
    let doc_path_glob = 'pack/*/*/' . fnameescape(package_name) . '/doc'
    let doc_path_list = split(globpath(&rtp, doc_path_glob), '\n')
    for doc_path in doc_path_list
      call s:helptags_one(doc_path)
    endfor
  endfor
endfunction

function! packutil#helptags_all() abort
  let doc_path_glob = 'pack/*/*/*/doc'
  let doc_path_list = split(globpath(&rtp, doc_path_glob), '\n')
  for doc_path in doc_path_list
    call s:helptags_one(doc_path)
  endfor
endfunction
