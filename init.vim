"   __  __ _ _____ _________
"   \ \ | |_|     V  __/  __|
"    \ \| | | | | | |  | [__
" [_] \___|_|_|_|_|_|  \____|
"
"---------------------------------------------------------------------------
" bundle settings {{{
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " dein.toml, dein_layz.tomlファイルのディレクトリをセット
  let s:toml_dir = expand('~/.config/nvim')
  " 起動時に読み込むプラグイン群
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
  " 遅延読み込みしたいプラグイン群
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

" 未インストールのプラグインがあればインストールを行う
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

" }}}

"---------------------------------------------------------------------------
" basic settings {{{
set number        " 行番号を非表示
set ruler        " ルーラーを表示 (noruler:非表示)
set clipboard+=unnamedplus
set mouse=a

" Insert Mode から抜けて保存までしちゃう
inoremap <silent> jj <ESC>:<C-u>w<CR>

" encode setting
set encoding=UTF-8

" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile

set background=dark
colorscheme nightfox
"colorscheme dracula

" set title
set title titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
set linespace=0
set showcmd        " コマンドをステータス行に表

" }}}

"---------------------------------------------------------------------------
" search settings {{{
set ignorecase  " 大文字小文字無視
set smartcase  " 大文字ではじめたら大文字小文字無視しない
set wrapscan  " 最後まで検索したら先頭へ戻る
"set nowrapscan  " 検索をファイルの先頭へループしない
set hlsearch  " 検索文字をハイライト
set incsearch  " インクリメンタルサーチ
" }}}

"---------------------------------------------------------------------------
" tab settings {{{
if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "そのファイルタイプにあわせたインデントを利用する
  filetype indent on
  " これらのftではインデントを無効に
  "autocmd FileType php filetype indent off

  autocmd FileType markdown        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType apache          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c               setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp             setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs              setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css             setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff            setlocal sw=4 sts=4 ts=4 et
  autocmd FileType go              setlocal sw=2 sts=2 ts=2 et
  autocmd FileType eruby           setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html            setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java            setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType json            setlocal sw=2 sts=2 ts=2 et
  autocmd FileType typescript      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType typescriptreact setlocal sw=2 sts=2 ts=2 et
  autocmd FileType vue             setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl            setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php             setlocal sw=2 sts=2 ts=2 et
  autocmd FileType python          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby            setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml            setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh              setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql             setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vb              setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim             setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh             setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml           setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml             setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml            setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh             setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala           setlocal sw=2 sts=2 ts=2 et
  autocmd FileType snippet         setlocal sw=4 sts=4 ts=4 et
endif

" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge
" }}}

"---------------------------------------------------------------------------
" move settings {{{
" deleteボタンが遠いんだ！
nmap <C-H> <BS>

" 0, 9で行頭、行末へ
nmap 1 ^
nmap 9 $
noremap <Space>h  ^
noremap <Space>l  $
" }}}

"---------------------------------------------------------------------------
" Windows  {{{
" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
" }}}

"---------------------------------------------------------------------------
" edit settings {{{
" insertモードを抜けるとIMEオフ
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" コンマの後に自動的にスペースを挿入
inoremap , ,<Space>

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

" }}}

"---------------------------------------------------------------------------
" cursor line settings {{{
set cursorline
" }}}

"---------------------------------------------------------------------------
" other settings {{{
" ;でコマンド入力( ;と:を入れ替)
noremap ; :

" 行末までのヤンクにする
nnoremap Y y$

" ファイルタイプ
nnoremap ,js   :<C-u>set filetype=javascript<CR>
nnoremap ,css  :<C-u>set filetype=css<CR>
nnoremap ,html :<C-u>set filetype=html<CR>

"<space>j, <space>kで画面送り
noremap <Space>j <C-f>
noremap <Space>k <C-b>

"ビジュアルモード時vで行末まで選択
vnoremap v $h

"move tab
nnoremap gh gT
nnoremap gl gt
" tc 新しいタブを一番右に作る
nnoremap gn :tabnew<CR>

" <,>による連続インデント
vnoremap < <gv
vnoremap > >gv

" <Space>q で強制終了
nnoremap <Space>q :<C-u>q!<Return>

" ESC*2 でハイライトやめる
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>

" 0番レジスタを使いやすくした
" via http://qiita.com/items/bd97a9b963dae40b63f5
vnoremap <silent> <C-p> "0p

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" https://twitter.com/yutakatay/status/1334995902184869889?s=21
noremap x "_x

" hogeファイル
command! Hoge edit ~/_/hoge/hoge.markdown

" https://mattn.kaoriya.net/software/vim/20071207013918.htm
" expand path
cmap <c-x> <c-r>=expand('%:p:h')<cr>/
" expand file (not ext)
cmap <c-z> <c-r>=expand('%:p:r')<cr>
" :cd <C-X> -> :cd /path/to/file/ になる

" 開いてるファイルの名前やパスをクリップボードにコピーする
" https://newbedev.com/yank-file-name-path-of-current-buffer-in-vim
" relative path  (src/foo.txt)
nnoremap ,cf :let @*=expand("%")<CR>
" absolute path  (/something/src/foo.txt)
nnoremap ,cF :let @*=expand("%:p")<CR>
" filename       (foo.txt)
nnoremap ,ct :let @*=expand("%:t")<CR>
" directory name (/something/src)
nnoremap ,ch :let @*=expand("%:p:h")<CR>

" }}}


"---------------------------------------------------------------------------
" plugin settings {{{
"---------------------------------------------------------------------------

" }}}

