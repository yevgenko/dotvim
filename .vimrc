" Plugins
call scriptmanager#Activate(["JSON", "The_NERD_tree", "snipmate", "bufexplorer.zip", "rails", "vim-ruby", "cucumber.zip", "vim-addon-php_ide", "PDV_revised", "fugitive", "Syntastic", "dbext", "surround", "Markdown", "textile", "DBGp_client", "vim-latex"])

" Enable loading filetype and indentation plugins
filetype plugin on
filetype indent on

" Turn syntax highlighting on
syntax on

" SETTINGS {{{

" GENERAL {{{

" Write contents of the file, if it has been modified, on buffer exit
set autowrite

" Allow backspacing over everything
set backspace=indent,eol,start

" Insert mode completion options
set completeopt=menu,longest,preview

" Use UTF-8 as the default buffer encoding
set enc=utf-8

" Remember up to 100 'colon' commmands and search patterns
set history=100

" Enable incremental search
set incsearch

" Always show status line, even for one window
set laststatus=2

" Jump to matching bracket for 2/10th of a second (works with showmatch)
set matchtime=2

" Don't highlight results of a search
set nohlsearch

" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

" Use F10 to toggle 'paste' mode
set pastetoggle=<F10>

" Show line, column number, and relative position within a file in the status line
set ruler

" Scroll when cursor gets within 3 characters of top/bottom edge
set scrolloff=3

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Use 4 spaces for (auto)indent
set shiftwidth=2

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Don't request terminal version string (for xterm)
set t_RV=

" Use 2 spaces for <Tab> and :retab
set tabstop=2

set expandtab
"set smartindent

" Write swap file to disk after every 50 characters
set updatecount=50

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,%,n~/.viminfo

" Use menu to show command-line completion (in 'full' case)
set wildmenu

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" Fix my <Backspace> key (in Mac OS X Terminal)
set t_kb=
fixdel

" Avoid loading MatchParen plugin
"let loaded_matchparen = 1

" netRW: Open files in a split window
let g:netrw_browse_split = 1

" Spell Languages
set spelllang=ru,en_us

" Set new grep command, which ignores SVN!
" TODO: Add this to SVN
set grepprg=/usr/bin/vimgrep\ $*\ /dev/null

" Highlight current line in insert mode.
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

" Highlight trailing whitespaces
match Todo /\s\+$/

" Show line numbers by default
"set number

" Enable folding by fold markers
set foldmethod=marker

" Autoclose folds, when moving out of them
set foldclose=all

" Jump 5 lines when running out of the screen
set scrolljump=5

" Repair wired terminal/vim settings
set backspace=start,eol,indent

" Allow file inline modelines to provide settings
set modeline

" change NERDTree whenever the three root is changed
let g:NERDTreeChDirMode=2

" toggle NERDTree on the right
let g:NERDTreeWinPos="right"

let g:PHP_removeCRwhenUnix=1

" Allow autocompletion using the TAB key via snipmate
let g:SuperTabMappingForward="<tab>"
let g:SuperTabMappingBackward="<s-tab>"

" Nice statusbar {{{

set laststatus=2
set statusline=
set statusline+=%n\                          " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w%0*\                 " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{&encoding},                " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=\ %{fugitive#statusline()}   " git branch
"if filereadable(expand("$VIM/vimfiles/plugin/vimbuddy.vim"))
"    set statusline+=\ %{VimBuddy()}         " vim buddy
"endif
set statusline+=%=                           " right align
set statusline+=0x%-8B\                      " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" }}}

" color scheme
"set background=dark
colorscheme tango

"}}}

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
autocmd BufRead * silent! %s/[\r \t]\+$//
autocmd BufEnter *.php :%s/[ \t\r]\+$//e

" }}}

" Ruby/Rails Specific {{{

" {{{ Automatic close char mapping

autocmd FileType ruby,rails,eruby inoremap <buffer> { {  }<LEFT><LEFT>
autocmd FileType ruby,rails,eruby inoremap <buffer> [ []<LEFT>
autocmd FileType ruby,rails,eruby inoremap <buffer> ( ()<LEFT>
autocmd FileType ruby,rails,eruby inoremap <buffer> ' ''<LEFT>
autocmd FileType ruby,rails,eruby inoremap <buffer> " ""<LEFT>

" }}} Automatic close char mapping

" }}}

" }}}

" MAPPINGS {{{

" GENERAL {{{

" save changes
map ,s :w<CR>
" exit vim without saving any changes
map ,q :q!<CR>
" exit vim saving changes
map ,w :x<CR>
" switch to upper/lower window quickly
map <C-J> <C-W>j
map <C-K> <C-W>k
" use CTRL-F for omni completion
imap <C-F> 
" map CTRL-L to piece-wise copying of the line above the current one
imap <C-L> @@@<ESC>hhkywjl?@@@<CR>P/@@@<CR>3s
" map ,f to display all lines with keyword under cursor and ask which one to
" jump to
nmap ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" use <F6> to toggle line numbers
nmap <silent> ,m :set number!<CR>
" page down with <Space>
nmap <Space> <PageDown>
" open filename under cursor in a new window (use current file's working
" directory)
nmap gf :new %:p:h/<cfile><CR>
" map <p> and <P> to paste below/above and reformat
nnoremap <Esc>P  P'[v']=
nnoremap <Esc>p  p'[v']=
" C-c and C-v - Copy/Paste в "глобальный клипборд"
vmap <C-c> "+y
imap <C-v> <esc>"+gPi
vmap <C-v> "+gP
" normal copy/paste
"vmap <C-c> y<Esc>i
"vmap <C-x> d<Esc>i
"imap <C-v> <Esc>pi
"nmap <C-z> u
"imap <C-z> <Esc>ui
" select all
nmap <C-a> ggVG
imap <C-a> <Esc>ggVG
" сортировка выделенного фрагмента, по алфавиту
vmap <C-S-a> <ESC>:'<,'>!sort<CR>
" C-y - удаление текущей строки
"nmap <C-y> dd
"imap <C-y> <esc>ddi
" remove the buffer
nmap <s-d> :bd<cr>
" C-d - дублирование текущей строки
imap <C-c> <esc>yypi
" окружение одного слова в двойные кавычки.
"imap <c-q> <esc>ysiw"wea
" перемещение строки вниз
imap <c-j> <esc>ddpi
" перемещение строки вверх
imap <c-k> <esc>ddkPi
" Поиск и замена слова под курсором
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/
" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" toggle NERDTree window
nmap <c-w>t :NERDTreeToggle<cr>

" F9 - "make" команда
map <F9> :make<cr>
vmap <F9> <esc>:make<cr>i
imap <F9> <esc>:make<cr>i

" }}}

" Set the <Leader> for combo commands
let mapleader = ","

" {{{ MovingThroughCamelCaseWords

nnoremap <silent><C-Left>  :<C-u>cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-Right> :<C-u>cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-Left>  <C-o>:cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-Right> <C-o>:cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>

" }}}

" Git mappings {{{

nnoremap <Leader>gs :Gstatus<cr>
" current file log
nnoremap <Leader>gl :Glog<cr>
" repository log, i.e. git log
nnoremap <Leader>gL :Git log<cr>
" update repository using `git up` command
nnoremap <Leader>gu :Git up<cr>
" diff mode
nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>gD :diffoff!<cr><c-w>h:bd<cr>

" }}}

" }}}
