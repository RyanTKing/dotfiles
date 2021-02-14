" Common Settings
"
" vim: foldmarker={{{,}}} foldlevel=0 foldmethod=marker noexpandtab

" ================================ General ================================ "{{{

filetype plugin on                          " Access filetypes
set mouse=a                                 " Enable mouse
set clipboard+=unnamedplus                  " Use system clipboard
set incsearch ignorecase smartcase hlsearch " highlight text while searching
set backspace=indent,eol,start              " Better backspacing
set foldlevel=0                             " Open all folds by default
set inccommand=nosplit                      " Feedback while doing substitutes
set grepprg=rg\ --vimgrep                   " Use rg as grepper
set encoding=utf-8 emoji                    " Encoding
set fillchars+=vert:\▏                      " Characters to fill the status line
set termguicolors                           " Opaque background
colorscheme nord                            " Nord everything
set history=1000                            " History length
set undofile                                " Persistent undo
set undodir=/tmp                            " Directory for undo files
set title                                   " Filename as tab title
set noshowmode                              " Hide mode
set noshowcmd                               " Don't show last command
set splitright                              " Open vertical splits to the right
set splitbelow                              " Open horizontal splits below
set signcolumn=yes                          " Show sign column
set number relativenumber                   " Hybrid line numbers

" Hybrid number in normal mode, absolute in insert mode
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

set list listchars=tab:▏\ ,eol:\ ,extends:,precedes:,space:\ ,trail:⋅ " Lists and whitespace

" }}}

" ============================== Performance ============================== "{{{

set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set redrawtime=10000
set synmaxcol=180
set re=1

" }}}

" ============================ Required by CoC ============================ "{{{

set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c

" }}}

" =============================== Autogroups ============================== "{{{

augroup Trailing
    autocmd!
    autocmd BufWritePre *.* :call RemoveTrailingSpaces()
augroup end

" Enter insert mode when terminal
augroup Term
    autocmd!
    autocmd TermOpen * setlocal nonu nornu signcolumn=no
    autocmd TermOpen * startinsert
augroup end

" }}}

