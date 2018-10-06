" common.vim
" ==========
" General settings common to the entire editor

" General
filetype plugin indent on
set encoding=utf-8
set mouse=a
set number
set relativenumber
set cursorline
syntax on
set path+=**
set wildmenu

" Appearance
set termguicolors
colorscheme base16-gruvbox-dark-medium
set updatetime=350
set signcolumn=yes
set wrap
set linebreak
set scrolloff=5
set shortmess+=c
set lazyredraw
set hidden
set inccommand=nosplit

" Folds
set foldmethod=indent
set foldlevelstart=20
hi Folded ctermfg=black
hi Folded ctermbg=white

" Whitespace
set listchars=tab:▏\ ,eol:\ ,extends:,precedes:,space:\ ,trail:⋅
set list

" Splits
set noequalalways
set splitright
set splitbelow

" Tabs
set noexpandtab
set tabstop=4
set shiftwidth=4
set smartindent

" Autocmds
" augroup Trailing
" 	autocmd!
" 	autocmd BufWritePre *.* :call RemoveTrailingSpaces()
" augroup end

augroup Term
	autocmd!
	autocmd TermOpen * setlocal nonu nornu signcolumn=no
	autocmd TermOpen * startinsert
augroup end

