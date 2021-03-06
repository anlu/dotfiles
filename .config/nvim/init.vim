filetype indent plugin on

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
nmap \ :set invnumber<CR>

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

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" indent two
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2

" Do not yank to default register when pasting over text
" http://stackoverflow.com/questions/290465/vim-how-to-paste-over-without-overwriting-register/4446608#4446608
" I haven't found how to hide this function (yet)
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

" NB: this supports "rp that replaces the selection by the contents of @r
vnoremap <silent> <expr> p <sid>Repl()

" Ctrl-p always opens in new tab by default
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

" vim-plug
call plug#begin('~/.config/nvim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'tpope/vim-surround'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

call plug#end()

colorscheme dracula
