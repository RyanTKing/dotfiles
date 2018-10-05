" ------------------------------- Basic Config Settings ----------------------
set autoindent
set backspace=2

set foldcolumn=4

set colorcolumn=120

set foldmethod=marker
set formatoptions=tqnw

set ignorecase smartcase

set laststatus=2
set textwidth=0

set linebreak wrap

set mouse=a
set number
set tabstop=4
set expandtab
set shiftwidth=4

set showcmd
set whichwrap=h,l,~,[,]

set wildmenu

set winminheight=0
set scrolloff=5

" set modeline
let mapleader=","

set incsearch
set hidden

set fileformats=unix,dos

set tags=./tags;/

set sessionoptions=blank,buffers,curdir,folds,help,tabpages,unix

set clipboard=unnamed
if has('unnamedplus')
        set clipboard=unnamedplus
endif

" Set colorscheme
" set t_Co=256
let base16colorspace=256
colorscheme base16-gruvbox-dark-medium
" hi Normal ctermbg=none
" hi NonText ctermbg=none
" hi clear LineNr
" hi clear SignColumn
" hi clear FoldColumn
" hi clear CursorLineNr
" hi clear CursorLine
set cursorline
hi CursorLine gui=underline cterm=underline

set backupskip=/tmp/*,/private/tmp/*

set nolist listchars=tab:›\ ,trail:-,extends:>,precedes:<,eol:¬

let g:html_wrong_comments = 1

let IspellLang = 'english'

if v:version > 702
        set undofile
        set undolevels=1000
        set undoreload=10000
        if isdirectory($HOME . '/.vim/undo') == 0
            :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
        endif
        set undodir=~/.vim/undo//
        set undofile

        au BufWritePre /tmp/* setlocal noundofile
        au BufWritePre /private/tmp/* setlocal noundofile
endif

if v:version >= 704
        set number relativenumber
endif

