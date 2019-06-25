" Leader key
let mapleader=","

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Select the word under the cursor
nnoremap <silent> * :set hlsearch<Cr>:exe "let @/='\\<'.expand('<cword>').'\\>'"<Cr>
nnoremap <silent> <a-*> :set hlsearch<Cr>:exe 'let @/=expand("<cWORD>")'<Cr><Paste>

" Rename word under cursor in whole document
nnoremap <silent><F3> :call RenameCWord("cword")<Cr>
inoremap <silent><F3> <Esc>:call RenameCWord("cword")<Cr>
nnoremap <silent><F4> :call RenameCWord("cWORD")<Cr>
inoremap <silent><F4> <Esc>:call RenameCWord("cWORD")<Cr>

" Toggle terminal
if has('nvim')
	nnoremap <silent><A-m> :call TermToggle(12)<CR>
	inoremap <silent><A-m> <Esc>:call TermToggle(12)<CR>
	tnoremap <silent><A-m> <C-\><C-n>:call TermToggle(12)<CR>
	tnoremap <silent><Esc> <C-\n><C-n>
endif


" FZF
nnoremap <silent><C-p> :call FZFIcons()<CR>

" Tagbar
noremap <silent><A-n> <Esc>:TagbarToggle<CR>
tnoremap <silent><A-n> <C-\><C-n>:TagbarToggle<CR>

" NERDTree
noremap <silent><A-b> <Esc>:NERDTreeToggle<CR>
tnoremap <silent><A-b> <C-\n><C-n>:NERDTreeToggle<CR>

" Coc
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" UltiSnips
" inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"
let g:UltiSnipsExpandTrigger = "<nop>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Buffer navigation
nnoremap <silent>gb :bn<Cr>
nnoremap <silent>gB :bp<Cr>
nnoremap <silent>ge :exec "e ".expand("<cWORD>")<Cr>

" Disable F1
nmap <F1> <nop>
imap <F1> <nop>

" Easy navigation
noremap gj G
noremap gk gg
noremap gh 0
noremap gl $

" Easy highlighting
noremap Gj <Esc>VG
noremap Gk <Esc>Vgg
noremap Gh <Esc> v0
noremap Gl <Esc>v$

" Better visual mode navigation
vnoremap <a-;> O
vnoremap ; <Esc>
noremap  <Space> <Nop>
vnoremap <Space> <Esc>
nnoremap <A-i> vi
nnoremap <A-a> va

" Move lines
nnoremap <silent><A-j> :m .+1<CR>==
nnoremap <silent><A-k> :m .-2<CR>==
inoremap <silent><A-j> <Esc>:m .+1<CR>==gi
inoremap <silent><A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent><A-j> :m '>+1<CR>gv=gv
vnoremap <silent><A-k> :m '<-2<CR>gv=gv

" Visual selection macro
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

