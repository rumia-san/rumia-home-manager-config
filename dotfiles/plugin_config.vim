nnoremap <F7> :FZF<CR>

let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

nnoremap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

if executable('rg')
	let g:ackprg = 'rg --vimgrep'
endif
nnoremap <leader>a :Ack<space>
nnoremap <leader>A :Ack <C-R><C-W>

colorscheme nord
