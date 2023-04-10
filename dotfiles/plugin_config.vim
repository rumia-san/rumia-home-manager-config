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

set showtabline=2
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'

let g:lightline                  = {}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}