with import <nixpkgs> {};

vim_configurable.customize {
    name = "vim";
    vimrcConfig.customRC = ''
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

        filetype plugin indent on

        syntax on
        set background=dark
        colorscheme dim

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

        " Ale settings
        let g:ale_linters = { 'haskell': ['hlint'] }
        let g:ale_fixers = { 'haskell': ['brittany'] }
        let g:ale_fix_on_save = 1

        let g:airline#extensions#ale#enabled = 1
        let g:airline#extensions#tabline#enabled = 1
    '';

    vimrcConfig.packages.jesseVim = with pkgs.vimPlugins; {
        # loaded on launch
        start = [ vim-nix fugitive ale vim-airline haskell-vim ];
    };
}
