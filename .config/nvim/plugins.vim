" plugins.vim
" ===========
" List of plugins to install

filetype off

call plug#begin('~/.local/share/nvim/plugged')

" GUI
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'

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
Plug 'raimondi/delimitmate'
Plug 'terryma/vim-multiple-cursors'
Plug 'justinmk/vim-syntax-extra'
Plug 'bfrg/vim-cpp-modern'
Plug 'klen/python-mode'
Plug 'fatih/vim-go'
Plug 'jodosha/vim-godebug'
Plug 'ekalinin/dockerfile.vim'
Plug 'bakpakin/ats2.vim'
Plug 'w0rp/ale'
Plug 'lervag/vimtex'
Plug 'tomtom/tcomment_vim'

" Autocompletion
Plug 'shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-docker'
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-zsh'
Plug 'poppyschmo/deoplete-latex'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}

call plug#end()

filetype plugin indent on
