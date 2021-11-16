syntax on


set noerrorbells
set tabstop=4 softtabstop =4
set shiftwidth=4
set expandtab
set smartindent
set nu rnu 
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set colorcolumn=100
set encoding=UTF-8
set term=screen-256color

" limelight setting to remote insert and highlight insert
set noshowmode
set laststatus=2    

highlight ColorColumn ctermbg=0 guibg=lightgrey
 

call plug#begin('~/.vim/plugged')


Plug 'morhetz/gruvbox'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree-project-plugin' 

Plug 'itchyny/lightline.vim'

Plug 'airblade/vim-gitgutter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'deoplete-plugins/deoplete-jedi'
"Plug 'ncm2/ncm2'                     " completion [dep]: nvim-0.2.2, nvim-yarp, python3
"Plug 'roxma/nvim-yarp'               " remote plugin framework required for ncm2
"Plug 'ncm2/ncm2-bufword'             " complete words in buffer
"Plug 'ncm2/ncm2-path'                " complete paths
"Plug 'ncm2/ncm2-jedi'                " Python completion
" Initialize plugin system
call plug#end()

colorscheme gruvbox
set background=dark

" ncm2 
"autocmd BufEnter * call ncm2#enable_for_buffer()      " enable ncm2 for all buffers
"set completeopt=noinsert,menuone,noselect             " IMPORTANT: :help Ncm2PopupOpen for more information
"let g:python3_host_prog='/usr/bin/python3'            " ncm2-jedi

" gitgutter
let g:gitgutter_async=0

let mapleader = ","
" PLUGIN: FZF
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR> 

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"Remove sqaure bracket from dev-icon
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif



let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeWinSize=27
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0
let g:NERDTreeGitStatusUntrackedFilesMode = 'all' " a heavy feature too. default: normal
let g:NERDTreeGitStatusShowClean = 1 " default: 0
let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0

" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule



"Window Splits
set splitbelow splitright
" Remap splits navigation to just CTRL + hjkl
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
" Make adjusing split sizes a bit more friendly
noremap <silent> <C-S-Up>:vertical resize +3<CR>
noremap <silent> <C-S-Down>:vertical resize -3<CR>
noremap <silent> <C-S-Left>:resize -3<CR>
noremap <silent> <C-S-Right>:resize +3<CR>
" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>tv <C-w>t<C-w>H
map <Leader>th <C-w>t<C-w>K
" Start terminals for R and Python sessions '\tr' or '\tp'
" map <Leader>tr :new term://bash<CR>iR<CR><C-\><C-n><C-w>k
map <Leader>tp :let $MYFILE=expand('%')<CR>:terminal<CR>python3 $MYFILE<CR>  
" map <Leader>td :new term://bash<CR>isqlite3<CR><C-\><C-n><C-w>
