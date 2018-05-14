function! packutil#packadd(package_name_list) abort
  for package_name in a:package_name_list
    execute 'packadd' package_name
  endfor
endfunction

function! s:helptags_one(doc_path) abort
  if filewritable(a:doc_path) == 2 && empty(glob(a:doc_path . '/tags*'))
    execute 'helptags' a:doc_path
  endif
endfunction

function! packutil#helptags() abort
  let doc_path_glob = 'pack/*/*/*/doc'
  let doc_path_list = split(globpath(&rtp, doc_path_glob), '\n')
  for doc_path in doc_path_list
    call s:helptags_one(doc_path)
  endfor
endfunction

function! packutil#source_ftdetect() abort
  let ftdetect_path_glob = 'pack/*/opt/*/ftdetect/*'
  let ftdetect_path_list = split(globpath(&rtp, ftdetect_path_glob), '\n')
  for ftdetect_path in ftdetect_path_list
    execute 'source' ftdetect_path
  endfor
endfunction
