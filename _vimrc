" ----------------------------------------------
"
"    My vimrc
"
" ----------------------------------------------
" how to adapt -> :source(:so) %

"  encoding
" set encoding=utf-8
" set fileencodings=utf-8,cp932,euc-jp,sjis

" --- Mapleader ---
let mapleader = "\<Space>"
let g:maplocalleader = "\<Space>"

" memo! each CMD
" nmap <leader>t [TABCMD]
" nmap <leader>e [OPENCMD]
" nmap <leader>s [SCRIPTCMD]
" nmap <leader>r [QuickCMD]
" nmap <leader>p [VTEXCMD]

" --- TAB ---
nnoremap [TABCMD] <nop>
nmap <leader>t [TABCMD]
nnoremap <silent> [TABCMD]e :<c-u>tabedit<CR>
nnoremap <silent> [TABCMD]c :<c-u>tabclose<CR>

nnoremap <silent> [TABCMD]n :tabnext<CR>
nnoremap <silent> [TABCMD]p :tabprevious<CR>
nnoremap <silent> [TABCMD]h :tabfirst<CR>
nnoremap <silent> [TABCMD]l :tablast<CR>

" --- Split ---
"nnoremap [SPLITCMD]
nnoremap sv :<c-u>vsplit<cr>
nnoremap ss :<c-u>split<cr>

nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sw <C-w>w

nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L

" change window size
nnoremap s> 5<C-w>>
nnoremap s< 5<C-w><
nnoremap s+ 3<C-w>+
nnoremap s- 3<C-w>-
nnoremap s= <C-w>=

nnoremap sq :q<cr>

" --- Open file ---
nnoremap [OPENCMD] <nop>
nmap <leader>e [OPENCMD]
" nnoremap <silent> [OPENCMD]. :vnew $VIM/vimrc<CR>
nnoremap <silent> [OPENCMD]. :e $VIM/vimrc<CR>
nnoremap <silent> [OPENCMD]0 :e %:h<CR>
nnoremap <silent> [OPENCMD]s :so %<CR>
nnoremap <silent> [OPENCMD]p :e ~/.vim/rc/dein.toml<CR>
nnoremap <silent> [OPENCMD]t :e ~/.vim/myscript/template/template.vim<CR>

" --- Substitute ---
" TODO
" Abolish.vim
" Qargs.vim No.6093

" --- ctags ---
" TODO ctags No.6387

" --- include ---
" TODO include No.7240
" <C-x><C-i>

" ----------------------------------------------
"
"    key mapping
"
" ----------------------------------------------
" help: map-modes
map q: :q

" comand mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <expr>%% getcmdtype() == ':' ? expand("%:h").'/' : '%%'

" normal mode
" nnoremap <silent> <C-l> : <C-u>nohlsearch<CR><C-l>
nnoremap <Leader>nh :nohlsearch<CR>
nnoremap <Leader>qqq :q!<CR>
nnoremap H ^
nnoremap L $
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <silent> <Leader>ll 20l
nnoremap <silent> <Leader>hh 20h
nnoremap <silent> <Leader>jj 20j
nnoremap <silent> <Leader>kk 20k
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap <CR> i<CR><Esc>
nnoremap <S-CR> o<Esc>
nnoremap %% i<C-r>=expand("%:p")<CR><CR><Esc>
nnoremap <leader>w :w<CR>
nnoremap <leader>] %
nnoremap gV `[v`]
nmap <Leader><Leader> V
nnoremap <leader>re :%s;\<<C-r><C-w>\>;g<left><left>;
nnoremap <silent><C-c> :%s/　/  /g<CR>

" TODO file path
" nnoremap <C-0> =expand('%:p')<CR>

" visual mode
" https://postd.cc/how-to-boost-your-vim-productivity/
" vp doesn't replace paste buffer
" I don't understand.
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" ----------------------------------------------
"
"    various settings
"
" ----------------------------------------------
" Undo file
set noundofile
" backup file
set nobackup

" Input 007 <C-a> -> 008
set nrformats=

" tab setting
set shiftwidth=4 softtabstop=4 expandtab

" indent setting
" set smartindent

" cmd history
set history=200

" when typping display ()
set showmatch

" display cursor line
set cursorline
" display ruler
set ruler
" display tab or CR
set list
" visual select
set virtualedit=block

" belloff
set belloff=all

" background
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none

" lines
set number
set relativenumber

" display menu
" status line
set laststatus=2
" cmd to status line
set showcmd
" cmd line height
set cmdheight=2
" title
set title
" long line, wrap
set wrap
" complement
set wildmenu
" tab line
set showtabline=2
" gui font
" set guifont=Consolas:h12:cSHIFTJIS
" set guifont=Consolas:h12:cANSI:qDRAFT
set guifont=HackGen:h12:cSHIFTJIS:qDRAFT

" ----------------------------------------------
"    find options
" ----------------------------------------------
"  hilight
set hlsearch
" increment search
set incsearch
" ignore captial/small letter
set ignorecase
" if include both letter type, identify letter type
set smartcase
" when I find, wrapscan
set wrapscan

" ----------------------------------------------
"
"    vim shell
"
" ----------------------------------------------
nnoremap <Leader>sh :bo terminal<CR>

" ----------------------------------------------
"
"    my vimscript settings
"
" ----------------------------------------------
source ~/.vim/myscript/template/template.vim
nnoremap [SCRIPTCMD] <nop>
nmap <leader>s [SCRIPTCMD]
nnoremap <silent> [SCRIPTCMD]t :Template tex<CR>ggdd4j
nnoremap <silent> [SCRIPTCMD]p :Template py<CR>


" ----------------------------------------------
"
"    plugin settings
"
" ----------------------------------------------
" 
" --- plugin-manager dein ---
"
if &compatible
  set nocompatible
endif

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~\.vim/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '\repos\github.com\Shougo\dein.vim'

" Add the dein installation directory into runtimepath
if has('vim_starting')
  " 初回起動時のみruntimepathにdeinのパスを指定する
  set runtimepath+=~\.vim\dein\repos\github.com\Shougo\dein.vim
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  let g:rc_dir    = expand('~\.vim\rc')
  let s:toml      = g:rc_dir . '\dein.toml'
  let s:toml_lazy = g:rc_dir . '\dein_lazy.toml'

  " 起動時に読み込むプラグイン群
  call dein#load_toml(s:toml,      {'lazy': 0})

  " 遅延読み込みしたいプラグイン群
  call dein#load_toml(s:toml_lazy, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" If you want to delete plugins.
if len(dein#check_clean()) > 0
  call map(dein#check_clean(), "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

" ----------------------------------------------
"
"    vim-expand-region settings
"    https://github.com/terryma/vim-expand-region
"
" ----------------------------------------------
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" ----------------------------------------------
"
"    QuickCMD settings
"    https://github.com/thinca/vim-quickrun
"
" ----------------------------------------------
" --- QuickRun keymap ---
nnoremap [QuickCMD] <nop>
nmap <leader>r [QuickCMD]
nnoremap <silent> [QuickCMD]r :QuickRun -outputter/buffer/split ":botright 8sp"<CR>

" ----------------------------------------------
"
"    vimtex settings
"    https://github.com/lervag/vimtex
"
" ----------------------------------------------
let g:vimtex_compiler_enabled = 1
let g:vimtex_view_general_viewer = 'C:\Users\Jiro\AppData\Local\SumatraPDF\SumatraPDF.exe'
" let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
let g:vimtex_compiler_latexmk = {
    \ 'background' : 1,
    \ 'continuous' : 1,
    \ 'options' : [
    \   '-pdfdvi',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
let g:vimtex_compiler_latexmk_engines = { '_' : '-pdfdvi' }

" --- vimtex keymap ---
nnoremap [VTEXCMD] <nop>
nmap <leader>p [VTEXCMD]

" --- コンパイル関連 ---
nnoremap <silent> [VTEXCMD]clean :!latexmk -c %<CR>
" <localleader>ll を[VTEXCMD]a にしたいけどできない…
" nnoremap <silent> [VTEXCMD]a <gid>ll

" --- 見出し関連 ---
" セクション(節)の見出し
nnoremap <silent> [VTEXCMD]s I\section{}<Esc>i
" サブセクション(小節)の見出し
nnoremap <silent> [VTEXCMD]ss I\subsection{}<Esc>i
" 引用
nnoremap <silent> [VTEXCMD]q I\begin{quotation}<CR>\end{quotation}<Esc>O
" verbatim
nnoremap <silent> [VTEXCMD]v I\begin{verbatim}<CR>\end{verbatim}<Esc>O

" --- 環境設定 ---
nnoremap <silent> [VTEXCMD]left O\begin{flushleft}<CR>\end{flushleft}<Esc>O
nnoremap <silent> [VTEXCMD]right O\begin{flushright}<CR>\end{flushright}<Esc>O
nnoremap <silent> [VTEXCMD]center O\begin{center}<CR>\end{center}<Esc>O
" 箇条書き ・
nnoremap <silent> [VTEXCMD]item i\begin{itemize}<CR>\end{itemize}<C-o>O\item 
" 箇条書き enumerate
nnoremap <silent> [VTEXCMD]enum i\begin{enumerate}<CR>\end{enumerate}<C-o>O\item 
" 脚注
nnoremap <silent> [VTEXCMD]foot a\footnote{} <Esc>hi
" 欄外
nnoremap <silent> [VTEXCMD]out a\marginpar{}<Esc>i
" 数式
" nnoremap <silent> [VTEXCMD]math o\[  \]<Esc>2hi
nnoremap <silent> [VTEXCMD]math o\begin{equation}<CR>\end{equation}<ESC>O
" ソースコード
" nnoremap <silent> [VTEXCMD]code o\begin{quote}<Esc>o\setlength{\baselineskip}{12pt}<CR>\begin{verbatim}<CR>\end{verbatim}<CR>\end{quote}<Esc>kO
nnoremap <silent> [VTEXCMD]code O\begin{tcolorbox}[colframe=black!50, colback=white, colbacktitle=black!50, coltitle=white, fonttitle=\bfseries\sffamily, title=title]<CR>\end{tcolorbox}<Esc>O\setlength{\baselineskip}{12pt}<CR>\begin{verbatim}<CR>\end{verbatim}<Esc>O
" 図
nnoremap <silent> [VTEXCMD]fig O\begin{figure}[H]<CR>\end{figure}<Esc>O\centering<CR>\includegraphics[width=10cm, height=7cm, keepaspectratio, clip]{}<CR>\caption{figure}<Esc>k$i
" 表
nnoremap <silent> [VTEXCMD]table O\begin{table}[H]<CR>\end{table}<Esc>O\caption{table}<CR>\begin{center}<CR>\end{center}<Esc>O\begin{tabular}{lrr} \\ \toprule<CR>A & B & C \\ \midrule<CR>a & b & c \\ \bottomrule<CR>\end{tabular}<Esc>
" わくわくする枠
nnoremap <silent> [VTEXCMD]waku O\begin{tcolorbox}[colframe=black!50, colback=white, colbacktitle=black!50, coltitle=white, fonttitle=\bfseries\sffamily, title=title]<CR>\end{tcolorbox}<Esc>O
" index
nnoremap <silent> [VTEXCMD]index i\index{}<Esc>i
