" Common Settings
filetype plugin indent on
set encoding=utf-8
set mouse=a
set number
set cursorline
syntax on
set path+=**
set wildmenu
set backspace=indent,eol,start
set updatetime=250
set signcolumn=yes
set wrap
set linebreak
set scrolloff=5
set shortmess+=c
set lazyredraw
set hidden
set colorcolumn=120
set nobackup
set nowritebackup
set noswapfile
set balloondelay=250
set hlsearch
set incsearch
set ttymouse=sgr

if has('termgui')
	set termguicolors
endif
if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif

" Folds
set foldmethod=indent
set foldlevelstart=20
hi Folded ctermfg=black
hi Folded ctermbg=white

" Tabs, trailing spaces
set listchars=tab:▏\ ,eol:\ ,extends:,precedes:,space:\ ,trail:⋅
set list
set esckeys

" Splits
set noequalalways
set splitright
set splitbelow

" Tabs
set noexpandtab
set tabstop=4
set shiftwidth=4
set smartindent

" Keymap fixes
set iminsert=0
set imsearch=0

" Justify text
runtime macros/justify.vim

" Highlights
highlight EndOfBuffer guifg=bg guibg=NONE
highlight Search guifg=#282a2e
highlight IncSearch guifg=#282a2e
highlight Child guifg=#fb4934 guibg=NONE cterm=bold gui=bold
highlight Sneak guifg=black guibg=orange

" Swap, backup, and undo files
set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//

" Autocmds
augroup Trailing
	autocmd!
	autocmd BufWritePre *.* :call RemoveTrailingSpaces()
augroup end

