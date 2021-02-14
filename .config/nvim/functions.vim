" Delete all trailing spaces
function! RemoveTrailingSpaces()
	let l:win_view = winsaveview()
	let l:save_slash = getreg('/')
	execute 'keepjumps%s:\s\+$::ge'
	call histdel("/", -1)
	call winrestview(l:win_view)
	call setreg('/', l:save_slash)
endfunction

" Toggle Terminal
let s:term_buf = 0
let s:term_win = 0

function! TermToggle(height)
	if win_gotoid(s:term_win)
		hide
	else
		new terminal
		exec "resize ".a:height
		try
			exec "buffer ".s:term_buf
			exec "bd terminal"
		catch
			call termopen($SHELL, {"detach": 0})
			let s:term_buf = bufnr("")
			setlocal nonu nornu scl=no nocul
		endtry
		startinsert!
		let s:term_win = win_getid()
	endif
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

