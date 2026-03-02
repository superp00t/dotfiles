set relativenumber
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

colorscheme codedark 

" vim-go requires this
filetype plugin indent on

" NERDTree doesn't show hidden files by default
let NERDTreeShowHidden=1
