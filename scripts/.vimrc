set ts=4
set nu
syntax enable
set nowrap
set paste

" for golang
autocmd FileType go noremap <buffer> <c-g><c-p> :GoDefPop<cr>
autocmd FileType go noremap <buffer> <c-g><c-d> :GoDef<cr>
autocmd FileType go noremap <buffer> <c-g><c-i> :GoImports<cr>
autocmd FileType go noremap <buffer> <c-g><c-m> :GoImplements<cr>
autocmd FileType go noremap <buffer> <c-g><c-f> :GoFmt<cr>


" theme
" /root/.vim/colors/molokai.vim
colorscheme molokai

set t_Co=256
let g:rehash256 = 1 
let g:molokai_original = 1 

filetype plugin indent on
