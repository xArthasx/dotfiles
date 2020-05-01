call plug#begin('~/.vim/plugged')

let g:plug_threads = 1

Plug 'Valloric/ListToggle'
Plug 'Yggdroot/indentLine'
Plug 'ap/vim-css-color', { 'for': 'css' }
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'gregsexton/MatchTag', { 'for': 'html' }
Plug 'joonty/vdebug'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-dispatch'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
Plug 'skywind3000/asyncrun.vim'
Plug 'mhinz/vim-signify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'szymonmaszke/vimpyter'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
call plug#end()
