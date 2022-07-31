vim-packutil
============

Utility functions to handle Vim packages.

Usage
-----

```vim
" packutil#packadd() sources specified packages
augroup opt
  autocmd!
  autocmd FileType go
  \ call packutil#packadd(['vim-go'])
  autocmd FileType html
  \ call packutil#packadd(['emmet-vim', 'html5.vim'])
  autocmd FileType perl
  \ call packutil#packadd(['perldoc-vim'])
augroup END
```

License
-------

MIT License

Author
------

nil2 <nil2@nil2.org>
