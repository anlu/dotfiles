set t_Co=256
set bg=dark
colorscheme solarized

filetype indent plugin on
syntax on

set number
set showmatch
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set autoindent
set nocompatible

set ruler

" See other tab completion options
set wildmenu

" Complete only up to point of ambiguity
set wildmode=list:longest

" Case sensitive searching only with capital letters, otherwise case
" insensitive
set ignorecase
set smartcase

set incsearch
set hlsearch

" Set a title
set title

" Start scrolling before edge of window is reached, giving more context
set scrolloff=3


" Use one centralized place for temporary files
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Switch ' and ` verbs. ` jumps to line and col, ' only jumps to line mark.
nnoremap ' `
nnoremap ` '

map j gj
map k gk
map <c-t> :tabnew
map <c-n> gt
map <c-p> gT

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

let python_highlight_all=1

" Display whitespace at end of line in red in insert mode
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Disable error bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" less syntax highligting
au BufNewFile,BufRead *.less set filetype=less

" syntastic
let g:syntastic_python_checkers=['pyflakes']

" html indent two
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" Pathogen
execute pathogen#infect()