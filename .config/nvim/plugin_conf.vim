" Airline
set laststatus=2
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '≣'
let g:airline#extensions#keymap#enabled = 0
let g:airline_detect_spelllang = 0
set noshowmode

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

let g:airline#extensions#tmuxline#enabled = 1
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"

let g:airline_powerline_fonts = 1

" DelimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 0
let delimitMate_nesting_quotes = ['``']

" Deoplete.nvim
set completeopt-=preview
let g:deoplete#enable_at_startup = 1

" coc.nvim
hi CocErrorSign ctermfg=01 ctermbg=18 guifg=#fb4934 guibg=#3c3836
hi CocErrorHighlight ctermfg=01 cterm=underline gui=undercurl guisp=#fb4934
hi CocWarningSign ctermfg=03 ctermbg=18 guifg=#fabd2f guibg=#3c3836
hi CocWarningHighlight ctermfg=03 cterm=underline gui=undercurl guisp=#fabd2f
hi CocInfoSign ctermfg=04 ctermbg=18 guifg=#83a598 guibg=#3c3836
hi CocInfoHighlight ctermfg=04 cterm=underline gui=undercurl guisp=#83a598
hi CocHintSign ctermfg=02 ctermbg=18 guifg=#b8bb26 guibg=#3c3836
hi CocHintHighlight ctermfg=02 cterm=underline gui=undercurl guisp=#b8bb26

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1

augroup NERDTree
	autocmd!
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup end

" Tagbar
let g:tagbar_sort = 0
let g:tagbar_compact = 1

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
inoremap <silent><C-_> <Esc>:TComment<Cr>
vnoremap <silent><C-_> :'<,'>TComment<Cr>

call tcomment#type#Define('c', '// %s')

" vimtex
let g:vimtex_compiler_progname = 'nvr'

