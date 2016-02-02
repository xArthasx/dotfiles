"Add semicolon at the end on ;
map ; A;<ESC>
"Fix Backspace Problem
:set backspace=indent,eol,start

"Plugins configuration
source ~/.vim/plugins.vim

"Reload .vimrc when it's written to
autocmd! bufwritepost .vimrc source %

"Rebind <Leader>
let mapleader = ","

"Remove highlighting
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

"Pane handling
map <silent> <C-h> :call WinMove('h')<cr>
map <silent> <C-j> :call WinMove('j')<cr>
map <silent> <C-k> :call WinMove('k')<cr>
map <silent> <C-l> :call WinMove('l')<cr>
map <silent> <C-x> :q<cr>

" Move to the window in the direction specified or open a new one
function! WinMove(key)
let t:curwin = winnr()
exec "wincmd ".a:key
if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
        wincmd v
    else
        wincmd s
    endif
    exec "wincmd ".a:key
endif
endfunction

"Sorting
vnoremap <Leader>s :sort<CR>

"Indenting and unindenting
vnoremap < <gv
vnoremap > >gv

"Highlight Whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

"Color scheme
set t_Co=256
color wombat256mod

"Airline configuration
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
let g:airline#extensions#tabline#enabled = 1


"Para cuando el statusLine solo aparece en split
set laststatus=2

"Enable syntax highlighting
filetype off
syntax on
filetype plugin indent on

"Line numbers and length
set number
set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=233

"History management
set history=700
set undolevels=700

"Using spaces for indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

"Making search a little smarter
set hlsearch
set incsearch
set ignorecase
set smartcase

"Eliminate auxiliary files
set nobackup
set nowritebackup
set noswapfile

"Equals align
map <Leader>a <esc>:Tab /=<CR>

"Rockets align
map <Leader>A <esc>:Tab /=><CR>

"Break lines with K
nnoremap K i<CR><esc>

"Ctrlp settings
let g:ctrlp_max_height = 30
let g:ctrlp_show_hidden = 1

"Syntastic configuration
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php', 'phpcs', 'phplint']
let g:syntastic_quiet_messages = {'level': 'warnings'}

"Php documentor configuration
au BufRead,BufNewFile *.php inoremap <buffer> <Leader>c :call pdv#DocumentCurrentLine()<CR>
let g:pdv_cfg_php4always = 1

"Nerdtree
map <Leader>n <esc>:NERDTreeToggle <CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'.  a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('phtml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

"Enable matchit for html matching with %
runtime macros/matchit.vim

"Syntastic configuration
let g:syntastic_auto_loc_list = 0
let g:syntastic_error_symbol='✗'
let g:syntastic_style_error_symbol='✗'

"Json Configuration
"Don't hide quotes in json files
let g:vim_json_syntax_conceal = 0


"Use w!! to save readonly files
cmap w!! w !sudo tee > /dev/null %

"Phinx execution
map <Leader>C <esc>:! ./vendor/bin/phinx create
map <Leader>M <esc>:! ./vendor/bin/phinx migrate<CR>
map <Leader>R <esc>:! ./vendor/bin/phinx rollback<CR>

"thyme
nmap <leader>T :!thyme -d<cr>
if executable('ag')
set grepprg=ag\ --nogroup\ --nocolor
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
nnoremap <leader>F :Ag -i <C-R><C-W> *
nnoremap <leader>f :Ag -i --vimgrep <C-R><C-W> % 
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
endif

"Vim expand configurations
map v <Plug>(expand_region_expand)
map <C-v>p <C-v> <Plug>(expand_region_shrink)


"TagBar Configurations
nnoremap <leader>b :TagbarOpenAutoClose<CR>
autocmd FileType php,js nested :TagbarOpen  
let g:tagbar_type_php  = {
    \ 'ctagstype' : 'php',
    \ 'kinds'     : [
        \ 'i:interfaces',
        \ 'c:classes',
        \ 'd:constant definitions',
        \ 'f:functions',
        \ 'j:javascript functions:1'
    \ ]
\ }
