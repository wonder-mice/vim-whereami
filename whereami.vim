function! s:strip(s)
    return substitute(a:s, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

function! s:whereami()
	let l:p = getpos(".")[1]
	let l:mind = -1
	let l:mlst = []
	while 0 < p && 0 != mind
		let l:ind = indent(p)
        let l:str = s:strip(getline(p))
        if 0 < strlen(str)
            if -1 == mind
                let l:mind = ind
            elseif ind < mind
                call insert(mlst, [ind, str])
                let l:mind = ind
            endif
        endif
		let l:p -= 1
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
