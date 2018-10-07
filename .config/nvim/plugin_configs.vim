" plugin_configs.vim
" ==================
" Configurations for specific plugins

" vim-airline
set laststatus=2
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline#extensions#keymap#enabled = 0
let g:airline_detect_spellang = 0
set noshowmode

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tmuxline#enabled = 1
let g:airline_powerline_fonts = 1

" tmuxline
let g:tmuxline_theme = 'vim_statusline_3'
let g:tmuxline_preset = 'tmux'

" DelimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 0
let delimitMate_nesting_quotes = ['`']

" ALE
highlight ALEErrorSign guibg=#3b3836 guifg=#fb4934

let g:airline#extensions#ale#enabled = 1
let g:ale_lint_delay = 350

let g:ale_sign_error = '⬥ '
let g:ale_sign_warning = '⬥ '

let g:ale_linters = {
	\ 'c': ['clang'],
	\ 'cpp': ['clang'],
\}

let g:airline#extensions#ale#enabled=1

" LanguageClient-neovim
let g:LanguageClient_serverCommands = {
			\ 'go': ['go-langserver', '-gocodecompletion'],
			\}

let g:LanguageClient_diagnosticsDisplay = {
			\	1: {
			\		"name": "Error",
			\		"signText": "⬥ ",
			\		"signTexthl": "ErrorSign",
			\	},
			\	2: {
			\		"name": "Warning",
			\		"signText": "⬥ ",
			\		"signTexthl": "WarningSign",
			\	},
			\	3: {
			\		"name": "Information",
			\		"signText": "⬥ ",
			\		"signTexthl": "InfoSign",
			\	},
			\	4: {
			\		"name": "Hint",
			\		"signText": "⬥ ",
			\		"signTexthl": "InfoSign",
			\	},
			\}

" Denite.nvim
call denite#custom#option('_', 'highlight_mode_normal', 'CursorLine')
call denite#custom#option('_', 'highlight_mode_insert', 'CursorLine')
call denite#custom#option('_', 'highlight_matched_range', 'None')
call denite#custom#option('_', 'highlight_matched_char', 'Child')
if executable('rg')
	call denite#custom#var('file/rec', 'command',
				\ ['rg', '--color', 'never', '--files', '-L', '--no-messages'])
	call denite#custom#var('grep', 'command', ['rg'])
	call denite#custom#var('grep', 'default_opts',
				\ ['--vimgrep', '--no-heading'])
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
	call denite#custom#var('grep', 'separator', ['--'])
	call denite#custom#var('grep', 'final_opts', [])
elseif executable('ag')
	call denite#custom#var('file/rec', 'command',
				\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
	call denite#custom#var('grep', 'command', ['ag'])
	call denite#custom#var('grep', 'default_opts',
				\ ['-i', '--vimgrep'])
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'pattern_opt', [])
	call denite#custom#var('grep', 'separator', ['--'])
	call denite#custom#var('grep', 'final_opts', [])
endif
call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('normal', 'i', '<denite:enter_mode:insert>', 'noremap')
call denite#custom#map('normal', '<Esc>', '<denite:quit>', 'noremap')
call denite#custom#map('normal', '<C-p>', '<denite:quit>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:quit>', 'noremap')

" Deoplete.nvim
set completeopt-=preview
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/7.0.0/lib/libclang.dylib'

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden=1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1

augroup NERDTree
	autocmd!
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup end

" Tagbar
let g:tagbar_sort = 0
let g:tagbar_compact = 1

augroup Tagbar
	autocmd!
	autocmd FileType c,cpp nested :TagbarOpen
augroup end

" vim-go
let g:go_highlight_build_constraints=1
let g:go_highlight_extra_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_interfaces=1
let g:go_highlight_methods=1
let g:go_highlight_operators=1
let g:go_highlight_structs=1
let g:go_highlight_types=1
let g:go_auto_sameids=1
let g:go_fmt_command='goimports'
let g:go_fmt_autosave=1
let g:go_auto_type_info=1
let g:go_list_type="quickfix"
let g:go_addtags_transform="snakecase"

" TComment
let g:tcomment_maps = 0
nnoremap <silent><C-_> :TComment<Cr>
inoremap <silent><C-_> <Esc>:TComment<Cr>a
vnoremap <silent><C-_> :'<,'>TComment<Cr>

call tcomment#type#Define('c', '// %s')

