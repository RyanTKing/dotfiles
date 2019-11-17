filetype off

call plug#begin('~/.local/share/nvim/plugged')

" GUI
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'ryanoasis/vim-devicons'

" Tools
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'christoomey/vim-tmux-navigator'

" Autocomplete
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" General Text Editing
Plug 'gcmt/wildfire.vim'
Plug 'easymotion/vim-easymotion'

" Languages
Plug 'justinmk/vim-syntax-extra'
Plug 'fatih/vim-go'
Plug 'jodosha/vim-godebug'
Plug 'bakpakin/ats2.vim'
Plug 'lervag/vimtex'
Plug 'kovisoft/slimv'
Plug 'jparise/vim-graphql'
Plug 'plasticboy/vim-markdown'

" Code Editing
Plug 'raimondi/delimitmate'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/dbext.vim'

call plug#end()
