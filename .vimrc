""" .vimrc 
""" author: pingtux

"" general settings
set nocompatible
syntax on filetype plugin indent on
filetype detect


""Plugins
"pathogen
execute pathogen#infect()
"gundo
nnoremap <F5> :GundoToggle<CR> "map gundo to the F5 key
"Latex
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
"Live Preview LaTex
nnoremap <F12> :LLPStartPreview<CR>
"Powerline
set rtp+=/usr/lib/python3.4/site-packages/powerline/bindings/vim
let $PYTHONPATH="/usr/lib/python3.4/site-packages"


""look&feel
set showcmd "show information about the current comand going on (bottom line)
set ruler "show ruler (bottom right corner)
set laststatus=2 "always display status line
set showmode "show current mode
set number "show line numbers
set background=dark
colorscheme solarized "colorscheme
set expandtab "expand tabs to spaces
set breakindent "take indentation of the line into accoutn when wrapping long lines
set relativenumber "show relative numbers on the side
set t_co=256 "256 color terminal


""search
set hlsearch "highlight results
set incsearch "incremental search
set smartcase "when we use a capital letter, case-sensitive. otherwise case-insensitive


""behavior
set mouse=a "activate mouse
set confirm "prompt when there are unsaved changes
set clipboard=unnamedplus "system clipboard
set foldmethod=indent "fold code with "za"
set foldlevel=99 "don't fold automatically
set undofile
set undolevels=1000 "how many undos
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
set undodir=~/.vim/undodir
set ttyfast "fast scrolling in a terminal
set scrolloff=999 "center search results
set wildmenu "Auto Complete Commands
set wildmode=longest:full,full


""GVim options
set guifont=Inconsolata\ for\ Powerline\ Medium\ 12


""userdefined commands
cmap sudow w !sudo tee > /dev/null %


""AutoCMDs
autocmd FileType tex autocmd BufWritePre <buffer> :%s/\s\+$//e "remove white space on the end of the line automatically (tex files)
