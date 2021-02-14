" Plugin Configurations
"
" vim: foldmarker={{{,}}} foldlevel=0 foldmethod=marker noexpandtab

" ============================== Leader Guide ============================= "{{{

let g:lmap = {}
call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>

let g:lmap.v = {
			\'name': 'Vim',
			\'e': ['e $MYVIMRC', 'Edit config'],
			\'r': ['source $MYVIMRC', 'Reload config'],
\}

let g:lmap.z = {
			\'name': 'Folds',
			\'a': ['call feedkeys("za")', 'Toggle under cursor'],
			\'o': ['call feedkeys("zr")', 'Open folds by one level'],
			\'c': ['call feedkeys("zm")', 'Close folds by one level'],
			\'t': ['call feedkeys("zi")', 'Toggle all folds']
\}

" }}}

" ================================== fzf ================================== "{{{

let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**' --glob '!.idea' --glob '!node_modules'"
let $FZF_PREVIEW_COMMAND = 'bat --theme=ansi-dark --style=numbers --color=always --pager=never --line-range=1:'.&lines.' {}'
let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'

" Projects
let g:fzfSwitchProjectWorkspaces = [ '~/Projects', '~/Work' ]
let g:fzfSwitchProjectProjects = [ '~/.config/nvim' ]

" Sessions
let g:fzf_session_path = $HOME . '/.local/share/nvim/session'

let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-x': 'split',
			\ 'ctrl-v': 'vsplit'
\}

let g:fzf_layout = {
			\'up':'~90%',
			\'window': {
				\'width': 0.8,
				\'height': 0.8,
				\'yoffset':0.5,
				\'xoffset': 0.5,
				\'highlight':'Comment'
			\}
\}


" Ctrl-P FTW
nnoremap <silent><C-p> :FilesWithDevicons<CR>

let g:lmap.f = {
			\'name': 'Files',
			\'l': ['FilesWithDevicons', 'List'],
			\'g': ['GFilesWithDevicons', 'Git List'],
			\'p': ['FzfSwitchProject', 'Projects'],
			\'h': ['History', 'History']
\}

let g:lmap.b = {
			\'name': 'Buffers',
			\'l': ['Buffers', 'List'],
			\'p': ['bp', 'Previous'],
			\'n': ['bn', 'Next'],
			\'x': ['bd', 'Close']
\}

let g:lmap.s = {
			\'name': 'Sessions',
			\'l': ['Sessions', 'List'],
			\'n': ['call feedkeys(":Session ")', 'New'],
			\'o': ['call feedkeys(":SLoad")', 'Open'],
			\'x': ['SQuit', 'Quit'],
\}

" }}}

" ================================ NERDTree =============================== "{{{

let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1

augroup NERDTree
	autocmd!

	" Exit vim if NERDTree is the only window left open
	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
				\ quit | endif

	" Prevent other files from replacing NERDTree
	autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
				\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
augroup end

noremap <silent><A-b> <Esc>:NERDTreeToggle<CR>
tnoremap <silent><A-b> <C-\n><C-n>:NERDTreeToggle<CR>

" }}}

" ================================== CoC ================================== "{{{

augroup coc
	autocmd!

	" Highlight the symbol and its references when holding the cursor
	autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Cycle options with tab
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Ctrl-space to complete
inoremap <silent><expr> <c-space> coc#refresh()
" Enter to complete
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Text objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Show coc.nvim documentation with K
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	endif
endfunction

" Scroll floating windows/popups with <C-f> and <C-b>
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Use <C-s> for selections ranges
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

let g:lmap.c = {
		\'name': 'CoC',
		\'g': {
			\'name': 'GoTo',
			\'d': ['call feedkeys("\<Plug>(coc-definition)")', 'Definition',],
			\'t': ['call feedkeys("\<Plug>(coc-type-definition)")', 'Type Definition',],
			\'i': ['call feedkeys("\<Plug>(coc-implementation)")', 'Implementation',],
			\'r': ['call feedkeys("\<Plug>(coc-references)")', 'References',],
		\},
		\'l': {
			\'name': 'List',
			\'d': ['CocList diagnostics', 'Diagnostics',],
			\'e': ['CocList extensions', 'Extensions',],
			\'c': ['CocList commands', 'Commands',],
			\'o': ['CocList outline', 'Outline',],
			\'s': ['CocList -I symbols', 'Symbols',],
			\'n': ['CocNext', 'Next Item',],
			\'p': ['CocPrev', 'Previous Item',],
			\'r': ['CocListResume', 'Resume Latest List',]
		\},
			\'r': ['call feedkeys("\<Plug>(coc-rename)")', 'Rename Symbol'],
			\'f': ['call CocAction("format")', 'Format Buffer'],
			\'F': ['call feedkeys("\<Plug>(coc-fix-current)")', 'Apply AutoFix'],
			\'o': ['call CocAction("runCommand", "editor.action.organizeImport")', 'Organize Imports'],
			\'a': ['call feedkeys("\<Plug>(coc-codeaction)")', 'Apply Code Action']
\}

" }}}

" ================================= vim-go ================================ "{{{

let g:go_fmt_command='goimports'
let g:go_doc_keywordprg_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_code_completion_enabled = 0
let g:go_debug_breakpoint_sign_text = '●'

" Fix default colors
hi goCoverageCovered ctermfg=green guifg=#A3BE8C
hi goCoverageUncover ctermfg=red guifg=#BF616A
hi GoDebugBreakpoint ctermfg=DarkBlue guifg=#BF616A
hi GoDebugCurrent gui=underline

" Highlights
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

function! s:goSetLeaderMappings()
	let g:lmap.r = {
				\'name': 'Run',
				\'b': ['GoBuild', 'Build'],
				\'B': ['call feedkeys("GoBuild ")', 'Build (args)'],
				\'r': ['GoRun', 'Run'],
				\'R': ['call feedkeys("GoRun ")', 'Run (args)'],
				\'i': ['GoInstall', 'Install'],
	\}
	let g:lmap.t = {
				\'name': 'Test',
				\'t': ['GoTest', 'Current package'],
				\'f': ['GoTestFunc', 'Current function'],
				\'c': ['GoCoverageToggle', 'Toggle coverage'],
				\'C': ['GoCoverage', 'Re-run coverage']
	\}
	let g:lmap.d = {
				\'name': 'Debug',
				\'b': ['GoDebugBreakpoint', 'Toggle breakpoint'],
				\'r': ['GoDebugStart', 'Run'],
				\'S': ['call feedkeys("GoDebugStart ")', 'Run (args)'],
				\'t': ['GoDebugTest', 'Test'],
				\'x': ['GoDebugStop', 'Stop'],
				\'u': ['GoDebugRestart', 'Restart'],
				\'c': ['GoDebugContinue', 'Continue'],
				\'n': ['GoDebugNext', 'Next'],
				\'i': ['GoDebugStep', 'Step'],
				\'o': ['GoDebugStepOut', 'StepOut']
	\}
endfunction

function! s:goUnsetLeaderMappings()
	unlet g:lmap.r
	unlet g:lmap.t
	unlet g:lmap.d
endfunction

augroup go
	autocmd!

	" register/deregister leader mappings
	autocmd BufEnter *.go call s:goSetLeaderMappings()
	autocmd BufLeave *.go call s:goUnsetLeaderMappings()
augroup end

" }}}

" ================================ Startify =============================== "{{{

let g:startify_padding_left = 10
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
			\ { 'type': 'dir'       },
			\ { 'type': 'files'     },
			\ { 'type': 'sessions'  },
			\ { 'type': 'commands' },
			\ ]

let g:startify_custom_header = [
			\'',
			\'            ███████╗ ██████╗ ██╗      ██████╗    ██╗ ██████╗ ',
			\'            ██╔════╝██╔═══██╗██║     ██╔═══██╗   ██║██╔═══██╗',
			\'            ███████╗██║   ██║██║     ██║   ██║   ██║██║   ██║',
			\'            ╚════██║██║   ██║██║     ██║   ██║   ██║██║   ██║',
			\'            ███████║╚██████╔╝███████╗╚██████╔╝██╗██║╚██████╔╝',
			\'            ╚══════╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝╚═╝ ╚═════╝ ',
			\'',
			\'',
			\'',
\]

" }}}

" ================================ Airline ================================ "{{{

let g:airline_theme='nord'
let g:airline_skip_empty_sections = 1

let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '|'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#fnamemod = ':t'

let airline#extensions#coc#error_symbol = '✘:'
let airline#extensions#coc#warning_symbol = '⚠:'

let g:airline#extensions#tmuxline#enabled = 1
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"

" }}}

" ================================ Tmuxline =============================== "{{{

let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
			\'a': '#(whoami)@#h',
			\'b': '#S',
			\'c': [
				\'#(/bin/bash $HOME/bin/kubes_status context white)',
				\'#(/bin/bash $HOME/bin/kubes_status namespace white)',
			\],
			\'cwin': '#I:#W#F',
			\'win': '#I:#W',
			\'x': '#(tmux-mem-cpu-load --interval 2)',
			\'y': ' #{artist} - #{track}',
			\'z': '%b %d %R'
\}

" }}}

" ================================= Ferret ================================ "{{{

let g:FerretMap=0

let g:lmap.F = {
			\'name': 'Find',
			\'f': ['call feedkeys(":Ack ")', 'Find'],
			\'r': ['call feedkeys(":Acks ")', 'Replace'],
			\'g': ['Rg', 'Grep'],
\}

" }}}

" =========================== The Nerd Commenter ========================== "{{{
"
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDDefaultAlign = 'left'

nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle

" }}}

" ============================= Other Plugins ============================= "{{{

" Bufferline
let g:bufferline_echo = 0

" rooter
let g:rooter_patterns = ['.git', 'go.mod', 'Makefile', 'README.md', 'init.vim']

" Tagbar
let g:tagbar_sort = 0
let g:tagbar_compact = 1
noremap <silent><A-n> <Esc>:TagbarToggle<CR>
tnoremap <silent><A-n> <C-\><C-n>:TagbarToggle<CR>

" UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"

" DelimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_nesting_quotes = ['``']

" }}}

