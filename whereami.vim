function! s:strip(s)
    return substitute(a:s, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

function! s:whereami()
	let l:p = getpos(".")[1]
	let l:mind = -1
	let l:mlst = []
	while 1 < p && 0 != mind
		let l:p -= 1
		let l:ind = indent(p)
        let l:str = s:strip(getline(p))
        if 0 < strlen(str)
            if ind < mind || -1 == mind
                call insert(mlst, [ind, str])
                "let l:mlst = [[int, str] + mlst
                let l:mind = ind
            endif
        endif
	endwhile
    return mlst
endfunction

function! Whereami()
	let l:mlst = s:whereami()
    for s in mlst
        echo repeat(" ", s[0]) . s[1]
    endfor
endfunction

nnoremap <leader>w :call Whereami()<CR>
