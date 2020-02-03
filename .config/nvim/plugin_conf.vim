" Airline
set laststatus=2
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '≣'
let g:airline#extensions#keymap#enabled = 0
let g:airline_detect_spelllang = 0
set noshowmode

let g:airline_skip_empty_sections = 1
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

" Tmuxline
let g:airline#extensions#tmuxline#enabled = 1
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"
let g:tmuxline_preset = {
		\ 'a': ['#S'],
		\ 'b': [
			\ '#(/bin/bash $HOME/bin/kubes_status context white)',
			\ '#(/bin/bash $HOME/bin/kubes_status namespace white)',
			\],
		\'cwin' : ['#I', '#W'],
		\'win'  : ['#I', '#W'],
		\ 'y': ['%l:%M %p', '%a, %B %d, %Y'],
		\ 'z': '#h',
		\ 'options': {
			\ 'status-justify': 'left',
		\}
\}

if has('macunix')
	let g:tmuxline_preset.x = '#(/bin/bash $HOME/.tmux/plugins/tmux-spotify/scripts/spotify_status.sh) '.
				\'#(/bin/bash $HOME/.tmux/plugins/tmux-spotify/scripts/spotify_track.sh)'
endif

" DelimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_nesting_quotes = ['``']

" FZF
if executable('rg')
	let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
	set grepprg=rg\ --vimgrep
	command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" Ferret
let g:FerretMap=0

" coc.nvim
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-angular', 'coc-go']
hi CocErrorSign ctermfg=01 guifg=#BF616A guibg=#3B4252
hi CocErrorHighlight ctermfg=01 cterm=underline gui=underline guifg=#BF616A
hi CocWarningSign ctermfg=03 guifg=#EBCB8B
hi CocWarningHighlight ctermfg=03 cterm=underline gui=underline
hi CocInfoSign ctermfg=04 guifg=#ECEFF4 guibg=#3B4252
hi CocInfoHighlight ctermfg=04 cterm=underline gui=underline guifg=#ECEFF4
hi CocHintSign ctermfg=02 guifg=#B48EAD guibg=#3B4252
hi CocHintHighlight ctermfg=02 cterm=underline gui=underline guifg=#B48EAD

" UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"

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

" vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_def_mapping_enabled = 0

let g:go_code_completion_enabled = 0
let g:go_test_show_name = 1
let g:go_fmt_autosave=1
let g:go_fmt_command='goimports'
let g:go_fmt_options = {
			\ 'goimports': '-local git.cogolo.net'
			\}
let g:go_snippet_engine = 'ultisnips'
let g:go_metalinter_command = "golangci-lint run --fast -exclude=vendor/... --enable-all=true --disable=gochecknoglobals"
let g:go_highlight_extra_types=1
let g:go_highlight_operators=1
let g:go_highlight_functions=1
let g:go_highlight_function_parameters=0
let g:go_highlight_function_calls=0
let g:go_highlight_types=1
let g:go_highlight_fields=1
let g:go_highlight_build_constraints=1
let g:go_highlight_generate_tags=1
let g:go_highlight_variable_declarations=0
let g:go_highlight_variable_assignments=0
let g:go_highlight_interfaces=1
let g:go_highlight_methods=1
let g:go_highlight_structs=1
let g:go_auto_type_info=0

" rust.vim
let g:rustfmt_autosave = 1

" slimv
let g:slimv_swank_cmd = "!ros -e '(ql:quickload :swank) (swank:create-server)' wait &"
let g:slimv_lisp = 'ros run'
let g:slimv_impl = 'sbcl'

" TComment
let g:tcomment_maps = 0
nnoremap <silent><C-_> :TComment<Cr>
inoremap <silent><C-_> <Esc>:TComment<Cr>
vnoremap <silent><C-_> :'<,'>TComment<Cr>

call tcomment#type#Define('c', '// %s')

" vimtex
let g:vimtex_compiler_progname = 'nvr'

