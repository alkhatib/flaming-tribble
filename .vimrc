execute pathogen#infect()

syntax on
filetype plugin indent on

colorscheme fine_blue2

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

nnoremap ;; :NERDTreeToggle<cr>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set tags=tags;/
