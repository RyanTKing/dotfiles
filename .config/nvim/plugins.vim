" Plugins
"
" vim: foldmarker={{{,}}} foldlevel=1 foldmethod=marker noexpandtab

" ================================ Vim-Plug =============================== "{{{

" Auto-install vim plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" }}}

" ============================= Remote Plugins ============================ "{{{
"
let g:python_host_prog = $HOME.'/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME.'/.pyenv/versions/neovim3/bin/python'
let g:ruby_host_prog = $HOME.'/.rbenv/versions/2.7.2/bin/neovim-ruby-host'

" }}}

" ================================== GUI ================================== "{{{

Plug 'arcticicestudio/nord-vim' " Colorscheme
Plug 'bling/vim-bufferline'     " Show open buffers in status
Plug 'mhinz/vim-startify'       " Fancy start screen
Plug 'psliwka/vim-smoothie'     " Smooth scrolling

" Airline
Plug 'vim-airline/vim-airline'        " Core plugin
Plug 'vim-airline/vim-airline-themes' " Themes

" }}}

" =============================== Navigation ============================== "{{{

Plug 'majutsushi/tagbar'   " File tag browser
Plug 'airblade/vim-rooter' " Auto switch roots

" NERDTree
Plug 'scrooloose/nerdtree'                     " Core plugin
Plug 'ryanoasis/vim-devicons'                  " Show icons in tree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Highlight filetypes
Plug 'xuyuanp/nerdtree-git-plugin'             " Show git status in tree

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fzf tool itself
Plug 'junegunn/fzf.vim'                             " Common vim functionality
Plug 'coreyja/fzf.devicon.vim'                      " Icons in popup
Plug 'benwainwright/fzf-project'                    " Switch project
Plug 'dominickng/fzf-session.vim'                   " Switch session

" }}}

" ================================= Editor ================================ "{{{

Plug 'godlygeek/tabular'       " Align stuff
Plug 'tpope/vim-surround'      " Easy surround selections
Plug 'preservim/nerdcommenter' " Super charged comments
Plug 'tpope/vim-repeat'        " Make . repeat other comments
Plug 'raimondi/delimitmate'    " Match quotes, parens, etc.
Plug 'gcmt/wildfire.vim'       " Select inside txt objects

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Big boy plugin
Plug 'sirver/ultisnips'                         " Snippets UI
Plug 'honza/vim-snippets'                       " Snippets themselves

                                                    " Language plugins
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' } " Golang
Plug 'uarun/vim-protobuf'                           " Proto
Plug 'plasticboy/vim-markdown'                      " Markdown
Plug 'vim-scripts/bash-support.vim'                 " Bash

" }}}

" ================================= Tools ================================= "{{{

Plug 'hecal3/vim-leader-guide' " Show leader keybindings
Plug 'wincent/ferret'          " Powerful searching
Plug 'tpope/vim-eunuch'        " Unix command bindings

" Version Control
Plug 'tpope/vim-fugitive' " Vim bindings for git commands
Plug 'mhinz/vim-signify'  " Git changes in gutter

" Tmux
Plug 'edkolev/tmuxline.vim'           " Airline-like statusbar for tmux
Plug 'christoomey/vim-tmux-navigator' " Seemless navigation in tmux

call plug#end()

" }}}

