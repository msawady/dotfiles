set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

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
set number
set cursorline
set smartindent
set showmatch

set expandtab
set tabstop=2
set shiftwidth=2

set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
set clipboard+=autoselect

