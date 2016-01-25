call plug#begin('~/.vim/plugged')

let g:plug_threads = 1

Plug '2072/PHP-Indenting-for-VIm'
Plug 'Townk/vim-autoclose'
Plug 'Valloric/ListToggle'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color', { 'for': 'css' }
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'godlygeek/tabular'
Plug 'gregsexton/MatchTag', { 'for': 'html' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'joonty/vdebug'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/syntastic'
Plug 'tobyS/vmustache' |  Plug 'tobyS/pdv'
Plug 'tobyS/vmustache' |  Plug 'tobyS/php-accessors.vim'
Plug 'tpope/vim-fugitive'
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }
Plug 'bling/vim-airline'
Plug 'tpope/vim-dispatch'
Plug 'terryma/vim-expand-region'
call plug#end()
