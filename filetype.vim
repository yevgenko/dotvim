if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  " local filetype changes go here
  au! BufRead,BufNewFile *.json setfiletype json
  " PHP Specific {{{

  " Use '//' to comment markers in php files
  autocmd FileType php setlocal commentstring=//\ %s

  " Disable phpsyntax based indenting for .php files
  au BufRead,BufNewFile *.php		set indentexpr= | set smartindent

  " .phps files handled like .php
  au BufRead,BufNewFile *.phps		set filetype=php

  " Reads the skeleton php file
  " Note: The normal command afterwards deletes an ugly pending line and moves
  " the cursor to the middle of the file.
  autocmd BufNewFile *.php 0r ~/.vim/skeleton.php | normal Gdd

  " Reads the skeleton txt file
  autocmd BufNewFile *.txt 0r ~/.vim/skeleton.txt | normal GddOAOAOAOAOAOAOAOAOA

  " Removing trailing whitespace
  autocmd BufRead *.php silent! %s/[\r \t]\+$//
  autocmd BufEnter *.php :%s/[ \t\r]\+$//e

  " }}}
  " {{{ Automatic close char mapping
  autocmd FileType python,ruby,rails,eruby inoremap <buffer> { {  }<LEFT><LEFT>
  autocmd FileType python,ruby,rails,eruby inoremap <buffer> [ []<LEFT>
  autocmd FileType eruby inoremap <buffer> <% <%=  %><LEFT><LEFT><LEFT>
  autocmd FileType python,ruby,rails,eruby inoremap <buffer> ( ()<LEFT>
  autocmd FileType python,ruby,rails,eruby inoremap <buffer> ' ''<LEFT>
  autocmd FileType python,ruby,rails,eruby inoremap <buffer> " ""<LEFT>
  " }}} Automatic close char mapping
augroup END
