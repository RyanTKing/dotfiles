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
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme base16-gruvbox-dark-soft
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
