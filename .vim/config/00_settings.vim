" ------------------------------- Basic Config Settings ----------------------
set autoindent
set backspace=2

set foldcolumn=4

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
set t_Co=256
let base16colorspace=256
colorscheme base16-ocean
hi Normal ctermbg=none
hi NonText ctermbg=none
hi clear LineNr
hi clear SignColumn
hi clear FoldColumn
hi clear CursorLineNr
hi clear CursorLine
hi CursorLine gui=underline cterm=underline

set backupskip=/tmp/*,/private/tmp/*

set nolist listchars=tab:›\ ,trail:-,extends:>,precedes:<,eol:¬

let g:html_wrong_comments = 1

let IspellLang = 'english'

if v:version > 702
        set undofile
        set undolevels=1000
        set undoreload=10000
        au BufWritePre /tmp/* setlocal noundofile
        au BufWritePre /private/tmp/* setlocal noundofile
endif

if v:version >= 704
        set number relativenumber
endif

"---------------------------- Plugin Specific Settings -----------------------
" Tagbar
let g:tagbar_autoclose = 1
nmap <Leader>t :TagbarToggle<CR>

" CtrlP
let g:ctrlp_open_new_file = 'h'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_extensions = ['funky', 'gazetteer']
let g:ctrlp_user_commands = "find %s -type f " .
                        \ "-not -wholename '*.svn*' " .
                        \ "-not -wholename '*.git*' " .
                        \ "-not -iname '*.jpg*' " .
                        \ "-not -iname '*.gif*' " .
                        \ "-not -iname '*.pdf*' " .
                        \ "-not -iname '*.png*' " .
                        \ "| while read filename; do " .
                        \ "echo $#filename $filename; " .
                        \ "done | sort -n | awk '{print $2}'"
let g:ctrlp_custom_ignore = {
                        \ 'dir': '\.git$|\.svn$',
                        \ 'file': '\.so$|\.dat$|\.DS_Store$|Thumbs.db|\.pdf$|\.jpg$|\.png$|\.ttf$|\.gif$'
                        \ }

" Snippets
let g:snips_author = 'Ryan King <hello@ryanking.com>'
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "ultisnips"]
let g:UltiSnipsDontReverseSearchPath = "0"

" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" LaTeX Suite
let g:Tex_DefaultTargetFormat = 'pdf'

" Committed
let g:committed_symbols_fancy = 1

" Signify
let g:signify_disable_by_default = 1

" Wildfire
let g:wildfire_fuel_map = "\\"
let g:wildfire_water_map = "<BS>"

" TagBar
nmap <F8> :TagbarToggle<CR>

" Supertab
let g:SuperTabDefaultCompletionType = "context"

" EasyMotion
nmap s <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1
