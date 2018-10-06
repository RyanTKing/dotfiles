" bindings.vim
" ============
" Custom key bindings

" Highlight word under cusor
nnoremap <silent> * :set hlsearch<Cr>:exe "let @/='\\<'.expand('<cword>').'\\>'"<Cr>
nnoremap <silent> <F1> :set hlsearch<Cr>:exe 'let @/=expand("<cWORD>")'<Cr>

nnoremap <silent><F3> :call RenameCWord("cword")<Cr>
inoremap <silent><F3> <Esc>:call RenameCWord("cword")<Cr>
nnoremap <silent><F4> :call RenameCWord("cWORD")<Cr>
inoremap <silent><F4> <Esc>:call RenameCWord("cWORD")<Cr>

" Toggle Terminal
nnoremap <silent><C-b> :call TermToggle(12)<CR>
inoremap <silent><C-b> <Esc>:call TermToggle(12)<CR>
tnoremap <silent><C-b> <C-\><C-n>:call TermToggle(12)<CR>
tnoremap <silent><Esc> <C-\><C-n>

" Denite
noremap <silent><C-p> :Denite file/rec<CR>
nnoremap <C-d> :Denite <tab>

" Tagbar
noremap <silent><C-]> <Esc>:TagbarToggle<CR>
tnoremap <silent><C-]> <C-\><C-n>:TagbarToggle<CR>

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

vnoremap <a-;> O
vnoremap ; <Esc>
noremap  <Space> <Nop>
vnoremap <Space> <Esc>

augroup LCN
	autocmd!
	autocmd FileType go,c,cpp nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
	autocmd FileType go,c,cpp nnoremap <silent> gh :call LanguageClient_textDocument_hover()<CR>
	autocmd FileType go,c,cpp nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
	autocmd FileType go,c,cpp nnoremap <silent> gs :call LanguageClient_textDocument_documentSymbol()<CR>
	autocmd FileType go,c,cpp nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
augroup end

