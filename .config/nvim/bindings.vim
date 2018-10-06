" bindings.vim
" ============
" Custom key bindings

" Highlight word under cusor
nnoremap <silent> * :set hlsearch<Cr>:exe "let @/='\\<'.expand('<cword>').'\\>'"<Cr>
nnoremap <silent> <a-*> :set hlsearch<Cr>:exe 'let @/=expand("<cWORD>")'<Cr>

nnoremap <silent><F3> :call RenameCWord("cword")<Cr>
inoremap <silent><F3> <Esc>:call RenameCWord("cword")<Cr>
nnoremap <silent><F4> :call RenameCWord("cWORD")<Cr>
inoremap <silent><F4> <Esc>:call RenameCWord("cWORD")<Cr>

" Toggle Terminal
nnoremap <silent><A-t> :call TermToggle(12)<CR>
inoremap <silent><A-t> <Esc>:call TermToggle(12)<CR>
tnoremap <silent><A-t> <C-\><C-n>:call TermToggle(12)<CR>
tnoremap <silent><Esc> <C-\><C-n>

" Denite
noremap <silent><C-p> :Denite file/rec<CR>
nnoremap <C-d> :Denite <tab>
nnoremap <C-b> :Denite buffer<CR>

" NERDTree
noremap <silent><A-m> <Esc>:NERDTreeToggle<CR>
tnoremap <silent><A-m> <C-\><C-n>:NERDTreeToggle<CR>

" Tagbar
noremap <silent><A-t> <Esc>:TagbarToggle<CR>
tnoremap <silent><A-t> <C-\><C-n>:TagbarToggle<CR>

" Cycle through buffers
nnoremap <silent>gb :bn<Cr>
nnoremap <silent>gB :bp<Cr>
nnoremap <silent>ge :exec "e ".expand("<cWORD>")<Cr>

" Unmap F1
nmap <F1> <nop>
imap <F1> <nop>

" Move to top/bottom/left/right easily
noremap gj G
noremap gk gg
noremap gh 0
noremap gl $

" Highlight a section easily
noremap Gj <Esc>VG
noremap Gk <Esc>Vgg
noremap Gh <Esc>v0
noremap Gl <Esc>v$

" Better visual mode bindings
vnoremap <a-;> O
vnoremap ; <Esc>
noremap  <Space> <Nop>
vnoremap <Space> <Esc>
nnoremap <A-i> vi
nnoremap <A-a> va

" Move lines around
nnoremap <silent><A-j> :m .+1<CR>==
nnoremap <silent><A-k> :m .-2<CR>==
inoremap <silent><A-j> <Esc>:m .+1<CR>==gi
inoremap <silent><A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent><A-j> :m '>+1<CR>gv=gv
vnoremap <silent><A-k> :m '<-2<CR>gv=gv

" Auto group for language client
augroup LCN
	autocmd!
	autocmd FileType go,c,cpp nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
	autocmd FileType go,c,cpp nnoremap <silent> gh :call LanguageClient_textDocument_hover()<CR>
	autocmd FileType go,c,cpp nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
	autocmd FileType go,c,cpp nnoremap <silent> gs :call LanguageClient_textDocument_documentSymbol()<CR>
	autocmd FileType go,c,cpp nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
augroup end

