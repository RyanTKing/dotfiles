" init.vim
" ========
" Author: Ryan King <hello@ryanking.com>
"
" Load other configuration files in specified order

set nocompatible

let s:config_path = $HOME.'/.config/nvim/'
let s:config_files = [
			\'functions.vim',
			\'plugins.vim',
			\'languages.vim',
			\'common.vim',
			\'bindings.vim',
			\'plugin_configs.vim',
			\]

for file in s:config_files
	if filereadable(s:config_path.file)
		exec "so ".s:config_path.file
	endif
endfor

