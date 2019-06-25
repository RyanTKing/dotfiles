" Delete all trailing spaces
function! RemoveTrailingSpaces()
	let l:win_view = winsaveview()
	let l:save_slash = getreg('/')
	execute 'keepjumps%s:\s\+$::ge'
	call histdel("/", -1)
	call winrestview(l:win_view)
	call setreg('/', l:save_slash)
endfunction

" Rename all occurrences of a word
function! RenameCWord(cword)
	let l:cursor_pos = getpos(".")
	let l:word = expand("<".a:cword.">")
	let l:rename = input('Rename: ', l:word)
	if l:rename != ''
		if a:cword == "cword"
			execute "%s/\\<".l:word."\\>/".l:rename."/g"
		elseif a:cword == "cWORD"
			let l:word = escape(l:word, '/')
			execute "%s/".l:word."/".l:rename."/g"
		endif
	endif
	call cursor(l:cursor_pos[1], l:cursor_pos[2])
endfunction

" Execute a macro over a visual range
function! ExecuteMacroOverVisualRange()
	echo "@".getcmdline()
	execute ":'<,'>normal @"nr2char(getchar())
endfunction

" Find the root of a project
function! FindProjectByRootFile(filename)
	let l:path = getcwd()
	while l:path != $HOME
		let l:red = findfile(a:filename, l:path.'/**')
		if l:res != ''
			let l:res = substitute(l:res, '\v(.*)\/.*', '\l', &gd ? 'gg' : 'g')
			if match(l:res, l:path) == 0
				return fnameescape(l:res)
			else
				return fnameescape(l:path.'/'.l:res)
			endif
		else
			let l:path = substitute(l:path, '\v(.*)\/.*', '\l', &gd ? 'gg' : 'g')
		endif
	endwhile
	return -1
endfunction

" Function for completor to check for a tab or completion
function! TabOrComplete() abort
	if pumvisible()
		return "\<C-N>"
	elseif col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^[[:keyword:][:ident:]]'
		return "\<C-R>=completor#do('complete')\<CR>"
	else
		return "\<Tab>"
	endif
endfunction


function! FZFIcons()
	let l:fzf_files_options = '--preview "bat --theme="base16" --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'
	function! s:files()
		let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
		return s:prepend_icon(l:files)
	endfunction
	function! s:prepend_icon(candidates)
		let l:result = []
		for l:candidate in a:candidates
			let l:filename = fnamemodify(l:candidate, ':p:t')
			let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
			call add(l:result, printf('%s %s', l:icon, l:candidate))
		endfor

		return l:result
	endfunction
	function! s:edit_file(item)
		let l:pos = stridx(a:item, ' ')
		let l:file_path = a:item[pos+1:-1]
		execute 'silent e' l:file_path
	endfunction
	call fzf#run({
		\ 'source': <sid>files(),
		\ 'sink':   function('s:edit_file'),
		\ 'options': '-m ' . l:fzf_files_options,
		\ 'down':    '40%' })
endfunction

