set scrolloff=7
set numberwidth=4
set number
set rtp+=~/.fzf
set hidden
set ignorecase
set smartcase
set termguicolors
" set mouse=a
set nobackup
set background=dark

set noswapfile
set nocompatible

set ttimeout
set ttimeoutlen=1
set ttyfast
set ruler
set cmdheight=1
set relativenumber
set ai " Auto indent
set si " Smart indent

set smartcase "smart cases when search
"set hlsearch "highlight search results
set incsearch "incremental searching
set ignorecase "ignore case when searching
set clipboard=unnamedplus
" set clipboard+=unnamed

    " augroup jsFileTypes
    "   au!
    "   autocmd BufNewFile,BufRead *.vue   set syntax=javascript
    " augroup END




map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

inoremap jj <esc>
inoremap jk <esc>
runtime macros/matchit.vim
"set clipboard=unnamed

" change cursors depending on mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" autocmd InsertEnter * set cul
" autocmd InsertLeave * set nocul

" Remove newbie crutches in Normal Mode
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>

"autocmd VimEnter * NERDTree
syntax on

packloadall
:set pastetoggle=<f5>
"nmap z  :call  Hi('1111')<CR>

"nmap 7 :vertical res-5<CR>

filetype plugin on

imap <Leader>' ''<ESC>i
imap <Leader>" ""<ESC>i

let g:markdown_fenced_languages = ['html', 'css', 'php',  'python', 'bash=sh', 'vim']

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
" autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear



call plug#begin()
" Plug 'stephpy/vim-php-cs-fixer'
Plug 'mileszs/ack.vim'
" Plug 'thaerkh/vim-workspace'
Plug 'posva/vim-vue'
" Plug 'w0rp/ale'
" Plug 'dense-analysis/ale'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mattn/emmet-vim'

Plug 'tpope/vim-surround'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'maxmellon/vim-jsx-pretty' 
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

Plug 'preservim/nerdtree'


Plug 'phanviet/vim-monokai-pro'

Plug 'tpope/vim-commentary'

Plug 'bagrat/vim-buffet'

Plug 'tpope/vim-repeat'

Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'


Plug 'arnaud-lb/vim-php-namespace'

" PHP Language server
Plug 'shawncplus/phpcomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'felixfbecker/php-language-server', {'do': 'composer install && composer run-script parse-stubs'}
"Plug 'm2mdas/phpcomplete-extended-laravel'

" Plug 'ludovicchabant/vim-gutentags'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}



Plug 'leafOfTree/vim-vue-plugin'
Plug 'bronson/vim-visual-star-search'



" Colorschemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'bluz71/vim-moonfly-colors'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'mhartington/oceanic-next'
Plug 'folke/tokyonight.nvim'

Plug 'jam1garner/vim-code-monokai'
Plug 'marko-cerovac/material.nvim'
Plug 'shaunsingh/moonlight.nvim'
Plug 'arzg/vim-substrata'

Plug 'chemzqm/vim-jsx-improve'



call plug#end()
" map <F7> gg=G<C-o><C-ov

" if empty(glob('~/.vim/autoload/plug.vim'))
"   silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
"   autocmd VimEnter * PlugInstall | source $MYVIMRC
" endif
" let g:workspace_autocreate = 1
" let g:workspace_session_name = 'Session.vim'
" let g:workspace_session_directory = $HOME . '/.vim/sessions/'
" let g:workspace_autosave_always = 1
nnoremap <leader>s :ToggleWorkspace<CR>

" autocmd FileType vue setlocal commentstring=#\ %s


let g:ack_use_cword_for_empty_search = 1
let g:ack_autoclose = 0
" let g:ackprg = 'rg --vimgrep --hidden --type-not sql --smart-case'
let g:ackprg = 'ag --vimgrep'
let $FZF_DEFAULT_OPTS = '--layout=reverse'
"let $FZF_DEFAULT_OPTS="--height 80% --color=dark --layout=reverse --margin=1,1 --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,pointer:12,marker:4,spinner:11,header:-1"
" let $FZF_DEFAULT_OPTS='--layout=reverse -vborder'
let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'


let g:vscode_style = "dark"
let g:vim_vue_plugin_load_full_syntax = 1

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_highlights_enabled = 0
let g:lsp_document_highlight_enabled = 1


function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>


"solarized norv
"colorscheme dracula

colorscheme monokai



inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"


let g:asyncomplete_auto_popup = 1


nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

let g:vim_jsx_pretty_colorful_config = 1


let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = 'git|node_modules'
let g:ctrlp_custom_ignore = '\v[\/](git|hg|svn|node_modules)$'
"noremap <Leader>s :update<CR>
"map <Esc><Esc> :w<CR>



cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>




noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
noremap <C-t> :tabnew split<CR>

" map gn :bn<cr>
" map gp :bp<cr>
"map gd :bd<cr>

nmap <C-w>t :tabnew %<cr>


nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>

nmap <F2> :update<CR>
vmap <F2> <Esc><F2>gv
imap <F2> <c-o><F2>


nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>



nnoremap <leader>d :LspDefinition <CR>
" nnoremap <leader>h :LspHover <CR>
nnoremap <leader>p :LspWorkspaceSymbol <CR>
nnoremap <leader>e :LspNextDiagnostic<CR>

" nnoremap <leader>f :LspDocumentFormat <CR>
"nnoremap <C-f> :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTreeToggle<CR>
"nnoremap <leader>f :NERDTreeFind<CR>

"nnoremap <C-p> :<C-u>FZF<CR>
"map <C-t><up> :tabr<cr>
"map <C-t><down> :tabl<cr>
"map <C-t><left> :tabp<cr>
"map <C-t><right> :tabn<cr>


" This shows what you are typing as a command. I love this!
set showcmd

" Folding Stuffs
set foldmethod=marker

" Needed for Syntax Highlighting and stuff
filetype on
syntax enable
set grepprg=grep\ -nH\ $*



" Who doesn't like autoindent?
set autoindent




" Spaces are better than a tab character
set expandtab
set smarttab


" Who wants an 8 character tab? Not me!
set shiftwidth=4
set softtabstop=4


" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full


" Incremental searching is sexy
set incsearch


" When I close a tab, remove the buffer
" set nohidden

" set nice column line
"set colorcolumn=90
"Open new split panes to right and bottom, which feels more natural than Vim’s default:

set splitbelow
set splitright

" Edit vimrc \ev
nnoremap <Leader>ev :tabnew<CR>:e $MYVIMRC<CR>
nnoremap <Leader>rv :so $MYVIMRC<CR>


nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)



let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"


" To map to <leader>D:
noremap <leader>D :call ReactGotoDef()<CR>




let g:vim_vue_plugin_config = {
      \'syntax': {
      \   'template': ['html'],
      \   'script': ['javascript'],
      \   'style': ['css'],
      \},
      \'full_syntax': [],
      \'initial_indent': [],
      \'attribute': 0,
      \'keyword': 0,
      \'foldexpr': 0,
      \'debug': 0,
      \}

let b:ale_fix_on_save = 0
let b:ale_fixers = ['prettier', 'eslint']
function! FormatPhp()
    :w
    let l:command =  "/usr/local/bin/php-cs-fixer fix " .  expand('%:p') 
    let l:output = system(l:command)
    :e
     " echo l:output

endfunction

" au! BufRead,BufNewFile *.vue set filetype=javascript
function! FormatJs()
    :w
    let l:command =  "/home/alex85/.nvm/versions/node/v18.7.0/bin/prettier --write " .  expand('%:p') 
    let l:output = system(l:command)
    :e
    " echo l:command
endfunction

function! FormatPython()
    :w
    let l:command =  "autopep8 --in-place " .  expand('%:p')
    let l:output = system(l:command)
    :e
    " echo l:command
endfunction

" autocmd FileType php inoremap <buffer> <leader>f <ESC> :call FormatPhp()<CR>
" autocmd FileType php nnoremap <buffer> <leader>f  :call FormatPhp()<CR>
" autocmd FileType php nnoremap <buffer> <C-s>  :call FormatPhp()<CR>

" autocmd FileType php nmap <leader>ff :call FormatPhp() <CR>
autocmd FileType php nmap <leader>ff :LspDocumentFormat <CR>
autocmd FileType javascript,vue,typescriptreact,typescript nmap <leader>ff :call FormatJs() <CR>
autocmd FileType python nmap <leader>ff :call FormatPython() <CR>

" autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

nnoremap <silent><leader>pi :source ~/.vimrc \| :PlugInstall<CR>




set wildmenu
set wcm=<Tab>
menu Exit.quit     :quit<CR>
menu Exit.quit!    :quit!<CR>
menu Exit.save     :exit<CR>
map <F10> :emenu Exit.<Tab>
