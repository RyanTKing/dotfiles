filetype off

call plug#begin('~/.local/share/nvim/plugged')

" GUI
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'

" Autocomplete
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Tools
Plug 'tpope/vim-eunuch'
Plug 'shougo/denite.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

" General Text Editing
Plug 'gcmt/wildfire.vim'
Plug 'easymotion/vim-easymotion'

" Code Editing
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-syntax-extra'
Plug 'raimondi/delimitmate'
Plug 'fatih/vim-go'
Plug 'jodosha/vim-godebug'
Plug 'bakpakin/ats2.vim'
Plug 'lervag/vimtex'
Plug 'tomtom/tcomment_vim'
Plug 'mattn/emmet-vim'
Plug 'fatih/vim-go'

call plug#end()
