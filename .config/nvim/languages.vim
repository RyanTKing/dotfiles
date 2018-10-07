" languages.vim
" =============
" Author: Ryan King <hello@ryanking.com>
"
" Language-specific settings

augroup Cpp
	autocmd!
	" Highlightings for C/C++ types and struct/class members.
	autocmd FileType c,cpp,h,hpp
		\ syntax match Type "\v<\w+_t>"                                  |
		\ syntax match Type "\v<__signed>"                               |
		\ syntax match Type "\v<(v|u|vu)\w+(8|16|32|64)>"                |
		\ syntax match Type "\v<(v|u|vu)?(_|__)?(int|short|char)>"       |
		\ syntax match Type "\v<(v)?(_|__)?(s|u)(8|16|32|64)>"           |
		\ syntax match Child "\v(-\>|\.)@<=(\s+)?\w+"                    |
		\ syntax match Function "\v(-\>|\.)@<=(\s+)?\w+(\s+)?(\(.*\))@=" |
augroup end

