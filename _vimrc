" Common -------------------------------
set nocompatible				" vim
" vundle -----------------
filetype off

"vundleのディレクトリ
set rtp+=~/dotfiles/vimfiles/vundle.git/
call vundle#rc()
"Bundle...は使用するプラグインを書く。詳細はguthubのREADMEが詳しい。
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
filetype plugin indent on     " required!

colorscheme desert			" カラースキーマの設定
set background=light			" 背景色の傾向(カラースキーマがそれに併せて色の明暗を変えてくれる)

" File ---------------------------------
set autoread				" 更新時自動再読込み
set hidden				" 編集中でも他のファイルを開けるようにする
set noswapfile				" スワップファイルを作らない
set nobackup				" バックアップを取らない
autocmd BufWritePre * :%s/\s\+$//ge	" 保存時に行末の空白を除去する
syntax on				" シンタックスカラーリングオン

" Indent -------------------------------
" tabstop:				Tab文字を画面上で何文字分に展開するか
" shiftwidth:				cindentやautoindent時に挿入されるインデントの幅
" softtabstop:				Tabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent smartindent		" 自動インデント，スマートインデント

" Assist imputting ---------------------
set backspace=indent,eol,start		" バックスペースで特殊記号も削除可能に
set formatoptions=lmoq			" 整形オプション，マルチバイト系を追加
set whichwrap=b,s,h,s,<,>,[,]		" カーソルを行頭、行末で止まらないようにする
"set clipboard=unnamed,autoselect		" バッファにクリップボードを利用する

" Complement Command -------------------
set wildmenu				" コマンド補完を強化
set wildmode=list:full			" リスト表示，最長マッチ

" Search -------------------------------
set wrapscan				" 最後まで検索したら先頭へ戻る
set ignorecase				" 大文字小文字無視
set smartcase				" 大文字ではじめたら大文字小文字無視しない
set incsearch				" インクリメンタルサーチ
set hlsearch				" 検索文字をハイライト

" View ---------------------------------
set showmatch				" 括弧の対応をハイライト
set showcmd				" 入力中のコマンドを表示
set showmode				" 現在のモードを表示
set number				" 行番号表示
set nowrap				" 画面幅で折り返さない
set list					" 不可視文字表示
set listchars=tab:>\ 			" 不可視文字の表示方法
set notitle				" タイトル書き換えない
set scrolloff=5				" 行送り
set display=uhex				" 印字不可能文字を16進数で表示

hi ZenkakuSpace gui=underline guibg=DarkBlue cterm=underline ctermfg=LightBlue " 全角スペースの定義
match ZenkakuSpace /　/ 			" 全角スペースの色を変更

set cursorline				" カーソル行をハイライト
augroup cch
	autocmd! cch
	autocmd WinLeave * set nocursorline
	autocmd WinEnter,BufRead * set cursorline
augroup END
:hi clear CursorLine
:hi CursorLine gui=underline
hi CursorLine ctermbg=black guibg=black


" StatusLine ---------------------------
set laststatus=2				" ステータスラインを2行に
set statusline=%<%f\ #%n%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=%l,%c%V%8P

" Charset, Line ending -----------------
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp
set ffs=unix,dos,mac			" LF, CRLF, CR
if exists('&ambiwidth')
	set ambiwidth=double		" UTF-8の□や○でカーソル位置がずれないようにする
endif

" バッファをクリップボードと共有
set clipboard+=unnamed

" --------------------------------------
"              my config
" --------------------------------------
" When insert mode, enable hjkl and enable go to home/end.
imap <c-o> <END>
imap <c-a> <HOME>
imap <c-h> <LEFT>
imap <c-j> <DOWN>
imap <c-k> <UP>
imap <c-l> <Right>

" When insert mode, change statusline.
let g:hi_insert = 'hi StatusLine gui=None guifg=Black guibg=Yellow cterm=None ctermfg=Black ctermbg=Yellow'


