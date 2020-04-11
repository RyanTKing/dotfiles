augroup Cpp
	autocmd!
	autocmd FileType c,cpp,h,hpp
		\ syntax match Type "\v<\w+_t>"                                  |
		\ syntax match Type "\v<__signed>"                               |
		\ syntax match Type "\v<(v|u|vu)\w+(8|16|32|64)>"                |
		\ syntax match Type "\v<(v|u|vu)?(_|__)?(int|short|char)>"       |
		\ syntax match Type "\v<(v)?(_|__)?(s|u)(8|16|32|64)>"           |
		\ syntax match Child "\v(-\>|\.)@<=(\s+)?\w+"                    |
		\ syntax match Function "\v(-\>|\.)@<=(\s+)?\w+(\s+)?(\(.*\))@=" |
augroup end

augroup Markdown
	autocmd!
	autocmd FileType markdown
		\ setlocal spell expandtab colorcolumn=80 tw=80                      |
		\ autocmd! Trailing                                                  |
augroup end

au! FileType fzf silent! tunmap <Esc>
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

au BufNewFile,BufRead *.ts setlocal filetype=typescript expandtab tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx expandtab tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.json setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.scss setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

