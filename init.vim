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

" Insert Mode
inoremap <silent> jj <ESC>:<C-u>w<CR>:" InsertMode抜けて保存

" encode setting
set encoding=utf-8

set background=dark
colorscheme dracula

" set title
set title titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
set linespace=0
set showcmd        " コマンドをステータス行に表
if has("win32") || has("win64")
  " sjisはWindows用
  set encoding=sjis
else
  set encoding=utf-8
endif

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

  autocmd FileType markdown   setlocal sw=4 sts=4 ts=4 et
  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType go         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType typescript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType snippet    setlocal sw=4 sts=4 ts=4 et
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
" other settings {{{
" ;でコマンド入力( ;と:を入れ替)
noremap ; :

" 行末までのヤンクにする
nnoremap Y y$

" 括弧入力後に←に移動
imap {} {}<Left>
imap [] []<Left>
 imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>

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

" hogeファイル
command! Hoge edit ~/Dropbox/hoge/hoge.markdown

" }}}


"---------------------------------------------------------------------------
" plugin settings {{{
"---------------------------------------------------------------------------

"---------------------------------------------------------------------------
" for Shougo/deoplete.nvim {{{
" Use deoplete.
let g:deoplete#enable_at_startup = 1
" }}}

"---------------------------------------------------------------------------
" for bling/vim-airline {{{
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_section_a = airline#section#create(['mode','','branch'])
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:Powerline_symbols = 'fancy'
set t_Co=256
" let g:airline_theme='tomorrow'

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
" }}}

"---------------------------------------------------------------------------
" for Shougo/denite.nvim {{{
" q で閉じる

" バッファ一覧
nnoremap <silent> <C-b> :<C-u>:Denite buffer<CR>
inoremap <silent> <C-b> <ESC>:<C-u>:Denite buffer<CR>
" ファイル一覧
nnoremap <silent> <C-f> :<C-u>:Denite file<CR>
inoremap <silent> <C-f> <ESC>:<C-u>:Denite file<CR>
" 最近使ったファイル一覧
nnoremap <silent> <C-e> :<C-u>:Denite file/old<CR>
inoremap <silent> <C-e> <ESC>:<C-u>:Denite file/old<CR>

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

" Floating Window
" https://qiita.com/lighttiger2505/items/d4a3371399cfe6dbdd56
let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7

" Change denite default options
call denite#custom#option('default', {
    \ 'split': 'floating',
    \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
    \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
    \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
    \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
    \ })

" }}}

" }}}

