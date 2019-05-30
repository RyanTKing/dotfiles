filetype off

call plug#begin('~/.vim/plugged')

" GUI
Plug 'chriskempson/base16-vim', { 'do': 'git checkout dictfix' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'

" Autocompletion
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
" Plug 'maralla/completor.vim'
" Plug 'ferreum/completor-tmux'
" Plug 'kyouryuukunn/completor-necovim'

" Tools
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-eunuch'
Plug 'ctrlpvim/ctrlp.vim'
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
Plug 'bakpakin/ats2.vim'
Plug 'lervag/vimtex'
Plug 'tomtom/tcomment_vim'
Plug 'mattn/emmet-vim'
Plug 'fatih/vim-go'
Plug 'kovisoft/slimv'
Plug 'jparise/vim-graphql'

call plug#end()
