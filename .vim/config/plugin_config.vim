" Airline
set laststatus=2

	" Bottom row
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '≣'
let g:airline#extensions#keymap#enabled = 0
let g:airline_detect_spelllang = 0
set noshowmode

	" Tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

    " Theme
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" let g:airline_theme = 'base16_ocean'
let g:airline_powerline_fonts = 1

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
" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" Snippets
let g:snips_author = 'Ryan King <hello@ryanking.com>'
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "ultisnips"]
let g:UltiSnipsDontReverseSearchPath = "0"

" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['go', 'golint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" LaTeX Suite
let g:Tex_DefaultTargetFormat = 'pdf'

" Committed
let g:committed_symbols_fancy = 1

" Signify
let g:signify_disable_by_default = 1

" Wildfire
let g:wildfire_fuel_map = "\\"
let g:wildfire_water_map = "<BS>"

" NERDTree
let NERDTreeShowHidden=1
nmap <F7> :NERDTreeToggle<CR>

" TagBar
nmap <F8> :TagbarToggle<CR>

" Supertab
let g:SuperTabDefaultCompletionType = "context"

" EasyMotion
nmap s <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1

" vim-go
" let g:go_metalinter_autosave = 1

" Polyglot
let g:polyglot_disabled = ['latex', 'golang', 'python']

" Pymode
let g:pymode_python = 'python3'

