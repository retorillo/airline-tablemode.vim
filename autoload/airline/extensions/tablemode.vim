" https://github.com/retorillo/airline-tablemode.vim
" (C) 2016 Retorillo
" Distributed under the MIT license

if !exists("g:airline#extensions#tablemode#symbol")
	let g:airline#extensions#tablemode#symbol = "❖"
endif
function! airline#extensions#tablemode#check()
	return exists("*g:tablemode#IsActive") && g:tablemode#IsActive() ? g:airline#extensions#tablemode#symbol : ""
endfunction
function! airline#extensions#tablemode#start()
	let g:airline_section_a .= airline#section#create(['tablemode'])
	call airline#update_statusline() 
endfunction
function! airline#extensions#tablemode#init(...)
	call airline#parts#define_function('tablemode', 'airline#extensions#tablemode#check')
	autocmd User AirlineAfterInit call airline#extensions#tablemode#start()
endfunction

