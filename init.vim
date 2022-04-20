" enable line numbers
set number

" set tab preferences
set tabstop=2
set shiftwidth=0
set expandtab

" enable autocomplete
" call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.w*' })

" start with NERDtree open
au VimEnter * NERDTree

" set go term
let g:go_term_enabled=1
let g:go_term_height=15
let g:go_term_reuse=1
let g:go_term_mode="split"
set splitbelow
