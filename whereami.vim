function! s:strip(s)
    return substitute(a:s, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

function! s:is_context(s)
    if 0 == strlen(a:s)
        return 0
    endif
    if "{" == a:s
        return 0
    endif
    return 1
endfunction

function! s:nwidth()
    let l:md = strlen(printf("%d", line("$")))
    return max([&numberwidth - 1, l:md])
endfunction

function! s:whereami()
	let l:p = getpos(".")[1]
	let l:mind = -1
	let l:mlst = []
	while 0 < p && 0 != mind
		let l:ind = indent(p)
        if ind < mind || -1 == mind
            let l:str = s:strip(getline(p))
            if s:is_context(str)
                if -1 == mind
                    let l:mind = ind
                elseif ind < mind
                    call insert(mlst, [str, ind, p])
                    let l:mind = ind
                endif
            endif
        endif
		let l:p -= 1
	endwhile
    return mlst
endfunction

function! Whereami()
	let l:mlst = s:whereami()
    let l:lfmt = printf("%%%dd ", s:nwidth())
    for s in mlst
        echo printf(lfmt, s[2]) . repeat(" ", s[1]) . s[0]
    endfor
endfunction

nnoremap <leader>w :call Whereami()<CR>
