" Common Settings
filetype plugin indent on
set encoding=utf-8
set mouse=a

set number
set relativenumber
set cursorline
syntax on
set path+=**
set wildmenu
set updatetime=300
set signcolumn=yes
set wrap
set linebreak
set scrolloff=5
set shortmess+=c
set lazyredraw
set hidden
set inccommand=nosplit
set colorcolumn=120
set cmdheight=2

" Color scheme
if has('termgui')
	set termguicolors
endif
colorscheme nord

" Folds
set foldmethod=indent
set foldlevelstart=20
hi Folded ctermfg=black
hi Folded ctermbg=white

" Tabs, trailing spaces
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
set autoindent

" Keymap fixes
set iminsert=0
set imsearch=0

" Justify text
runtime macros/justify.vim

" Highlights
highlight EndOfBuffer guifg=bg guibg=NONE
highlight Search guifg=#2E3440
highlight IncSearch guifg=#2E3440
highlight Child guifg=#BF616A guibg=NONE cterm=bold gui=bold
highlight Sneak guifg=black guibg=orange

" Autocmds
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

" Python hosts for remote plugins
if has('nvim')
	let g:python_host_prog = $HOME.'/.pyenv/versions/neovim2/bin/python'
	let g:python3_host_prog = $HOME.'/.pyenv/versions/neovim3/bin/python'
	let g:ruby_host_prog = $HOME.'/.rbenv/versions/2.6.2/bin/neovim-ruby-host'
endif
