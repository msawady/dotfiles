set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'derekwyatt/vim-scala'

Plugin 'tpope/vim-surround'

call vundle#end()
filetype plugin indent on

" md as markdown, instead of modula2
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
" Disable highlight italic in Markdown
autocmd FileType markdown hi! def link markdownItalic LineNr


set fenc=utf-8
set nobackup
set noswapfile
set showmatch

syntax on
set ruler 
set number
set cursorline

set expandtab
set tabstop=2
set shiftwidth=2
set smartindent

set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nnoremap <ESC><ESC> :nohl<CR>
set clipboard+=autoselect
set backspace=indent,eol,start




" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv
