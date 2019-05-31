" Airline
set laststatus=2
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '≣'
let g:airline#extensions#keymap#enabled = 0
let g:airline_detect_spelllang = 0
set noshowmode

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
let delimitMate_expand_space = 0
let delimitMate_nesting_quotes = ['``']

" FZF
if executable('rg')
	let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
	set grepprg=rg\ --vimgrep
	command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" coc.nvim
hi CocErrorSign ctermfg=01 ctermbg=18 guifg=#fb4934 guibg=#3c3836
hi CocErrorHighlight ctermfg=01 cterm=underline gui=underline guifg=#fb4934
hi CocWarningSign ctermfg=03 ctermbg=18 guifg=#fabd2f guibg=#3c3836
hi CocWarningHighlight ctermfg=03 cterm=underline gui=underline guifg=#fabd2f
hi CocInfoSign ctermfg=04 ctermbg=18 guifg=#83a598 guibg=#3c3836
hi CocInfoHighlight ctermfg=04 cterm=underline gui=underline guifg=#83a598
hi CocHintSign ctermfg=02 ctermbg=18 guifg=#b8bb26 guibg=#3c3836
hi CocHintHighlight ctermfg=02 cterm=underline gui=underline guifg=#b8bb26

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
let g:go_metalinter_autosave = 0
let g:go_metalinter_command = "golangci-lint run --fast -exclude=vendor/... --enable-all=true --disable=gochecknoglobals"

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

