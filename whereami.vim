function! s:whereami()
	let l:p = getpos(".")[1]
	let l:mind = indent(p)
	let l:mlst = []
	while 1 < p && 0 != mind
		let l:p -= 1
		let l:ind = indent(p)
		if ind < mind
			let l:str = substitute(getline(p), "^\\s*", "", "")
			let l:mlst = [str] + mlst
			let l:mind = ind
		endif
	endwhile
	return join(mlst, " :: ")
endfunction

function! Whereami()
	let l:s = s:whereami()
	echo s
endfunction

nnoremap <leader>w :call Whereami()<CR>
