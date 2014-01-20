execute pathogen#infect()

syntax on
filetype plugin indent on

colorscheme Mustang

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

nnoremap ;; :NERDTreeToggle<cr>
"Close window if only buffer open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set tags=tags;/

let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif

set number

let mapleader= ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

set hid "change buffer without saving

set whichwrap+=<,>,h,l

set ignorecase "ignore case in search
set smartcase  "unless the search term has uppercase

"Not sure what this does
"nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
"nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>

set hlsearch
set magic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

set lbr

"Is the auto line break at 78 becomes a hassle
"set tw=0

imap ii <Esc>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

"clear highlighted search
map <silent> <leader><cr> :noh<cr>

" Use the arrows to something usefull (switch buffers)
map <right> :bn<cr>
map <left> :bp<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" When pressing <leader>cd switch to the directory of the open buffer
nmap <leader>cd :cd %:p:h<cr>

" Format the statusline
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/aalkhatib/', "~/", "g")
    return curdir
endfunction

"Shortcut for displaying/hiding Invisibles from vimcasts
nmap <leader>l :set list!<CR>
set listchars+=tab:▸\ ,eol:¬,trail:␣,extends:⇉,precedes:⇇,nbsp:·

nnoremap k gk
nnoremap j gj

map <leader>t :TlistToggle<CR>
map <leader>d :FufDir<CR>
map <leader>f :FufFile<CR>
map <leader>b :FufBuffer<CR>
