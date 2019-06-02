" Replace tabs with 4 spaces
set tabstop=4 shiftwidth=4 expandtab

set mouse=a	" Mouse scrolling and cursor control
set ai		" Auto-indent

" Show hybrid line number and relative line numbers
set number relativenumber

" Open splits to the right and bottom (opposite of default)
set splitright splitbelow

" Save as root command
command! -nargs=0 Sw w !sudo tee % > /dev/null

execute pathogen#infect()

filetype plugin indent on

syntax on
set background=dark
colorscheme monokai

set backspace=indent,eol,start " backspace over everything in insert mode

syntax sync fromstart " hopefully this fixes the colorscheme breaking

" Buffer navigation
nnoremap <F9>      :bprevious<CR>
nnoremap <F10>     :bnext<CR>
nnoremap <C-t>     :enew<CR>
inoremap <F9>	   <Esc>:bprevious<CR>i
inoremap <F10>     <Esc>:bnext<CR>i
inoremap <C-t>     <Esc>:enew<CR>

" Folding settings
set foldmethod=syntax
set foldlevel=99
set nofoldenable

" YouCompleteMe settings
let g:ycm_show_diagnostics_ui = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_include_dirs = ['../include/']
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" NERD Commenter settings
let mapleader=","

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

let g:NERDAltDelims_java = 1

" Airline Settings
let g:airline_powerline_fonts = 1
let g:airline_theme='angr'
let g:airline#extensions#tabline#enabled = 1

