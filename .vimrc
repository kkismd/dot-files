set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-rails'
Bundle 'surround.vim'
Bundle 'snipMate'
Bundle 'endwise.vim'
Bundle 'matchit.zip'
Bundle 'ku'
Bundle 'openssl.vim'
Bundle 'unite.vim'
Bundle 'scala.vim'

set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartcase
set smartindent
set smarttab
set incsearch
set laststatus=2
set hlsearch
set nowrap
"Changeコマンド実行時に置き換え範囲を$で表示
set cpoptions+=$
"日本語の行の連結時には空白を入力しない。
set formatoptions+=mM
"コマンドをステータス行に表示
set showcmd

syntax on
filetype on
filetype indent on
filetype plugin on

"colorscheme pyte
"colorscheme TermPyte
"colorscheme desert
colorscheme railscasts

"起動時のメッセージを消す
set shortmess+=I
" statuslineに文字コードと改行コードを表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" 改行時に自動でコメントが挿入されるのをやめる
autocmd FileType * setlocal formatoptions-=ro

" 文字コードの自動認識
" fileencodingsを構築
set fileencodings+=iso-2022-jp,euc-jp,sjis,cp932
set fileencodings+=utf-8,ucs-2le,ucs-2
" 日本語を含まない場合は fileencoding に encoding を使うようにする
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

"以前ファイルを開いた時のカーソル位置に移動する
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


" for rails.vim
let g:rails_level=4
let g:rails_default_file="app/controllers/application.rb"
let g:rails_default_database="sqlite3"

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType html set filetype=xhtml
autocmd Filetype html set omnifunc=htmlcomplete#CompleteTags
autocmd Filetype css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" qfixhowm
set runtimepath+=~/src/qfixapp
let QFixHowm_Key = 'g'
let howm_dir             = '~/Dropbox/howm'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.howm'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'

let mygrepprg = 'grep'
let MyGrep_ShellEncoding = 'utf-8'

" surround
"  for erb
let g:surround_{char2nr('%')} = "<% \r %>"
let g:surround_{char2nr('-')} = "<% \r -%>"
let g:surround_{char2nr('=')} = "<%=\r %>"
"  for gettext
let g:surround_{char2nr('_')} = "_('\r')"

