set number relativenumber

call plug#begin()
Plug 'endel/vim-github-colorscheme'
Plug 'davidhalter/jedi-vim'
Plug 'nvie/vim-flake8'
Plug 'itspriddle/vim-shellcheck'
Plug 'vim-autoformat/vim-autoformat'
Plug 'alx741/vinfo'
call plug#end()

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

colorscheme github
set tabstop=4
set shiftwidth=4
set expandtab

command! Flake :call flake8#Flake8()
