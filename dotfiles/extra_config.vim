set backspace=indent,eol,start
set nocscopeverbose
set autoindent
set cindent
set number
set cursorline
hi CursorLine term=underline cterm=underline
set foldmethod=indent
set nofoldenable
set scrolloff=15
set ttyfast
set lazyredraw
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim
set list listchars=tab:>-,nbsp:.,trail:.,extends:>,precedes:<
let &showbreak = '^'
set hlsearch
nnoremap <leader><space> :let @/=''<CR>
nnoremap <leader><C-R> :%s/\V<C-R><C-W>//gc<Left><Left><Left>
nnoremap <leader><C-F> :lvimgrep /<C-R><C-W>/ %<Left><Left><Left>
"open quickfix automatically
" create a self-clearing autocommand group called 'qf'
augroup qf
    " clear all autocommands in this group
    autocmd!
    " do :cwindow if the quickfix command doesn't start with a 'l' (:grep, :make, etc.)
    autocmd QuickFixCmdPost [^l]* cwindow
    " do :lwindow if the quickfix command starts with
    " a 'l' (:lgrep, :lmake, etc.)
    autocmd QuickFixCmdPost l*    lwindow
    " do :cwindow when Vim was started with the '-q' flag
    autocmd VimEnter        *     cwindow
augroup END
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
