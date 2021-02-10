filetype off

call plug#begin('~/.local/share/nvim/plugged')

" GUI
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'yuttie/comfortable-motion.vim'

" Tools
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
" Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'christoomey/vim-tmux-navigator'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" General Text Editing
Plug 'gcmt/wildfire.vim'
Plug 'easymotion/vim-easymotion'

" Plug 'rhysd/vim-grammarous', { 'for': 'markdown' }
" Plug 'reedes/vim-wordy'
" Plug 'reedes/vim-lexical'
" Plug 'kamykn/spelunker.vim'

" Languages
Plug 'justinmk/vim-syntax-extra'
Plug 'fatih/vim-go'
Plug 'bakpakin/ats2.vim'
Plug 'jparise/vim-graphql'
Plug 'plasticboy/vim-markdown'
Plug 'leafgarland/typescript-vim'
Plug 'curist/vim-angular-template'
Plug 'pangloss/vim-javascript'
Plug 'herringtondarkholme/yats.vim'
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'

" Code Editing
Plug 'raimondi/delimitmate'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/dbext.vim'

call plug#end()
