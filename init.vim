"外部関連
set noswapfile		"swapファイルを作らない
set noundofile		"undoファイルを作らない
set nobackup		"バックアップファイルを作らない
set encoding=UTF-8	"エンコードはUTF-8で
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8

"表示関連
set ruler			"現在行の番号を表示
set number			"行番号
set title			"ファイル名表示
set tabstop=4		"インデントをスペース4つ分に
set shiftwidth=4	"自動生成されるインデントもスペース4つ分に
set smartindent		"オートインデント
set display=lastline
					"限界まですべて表示
set wrap			"ウィンドウ幅で折り返し
set pumheight=10	"補完メニューの最大長
set fileformats=unix,dos
					"自動認識させる改行コード指定
set cursorline		"現在行に下線をつける
hi clear CursorLine	"下線を打ち消し、行番号のみハイライト
					
"検索関連
set incsearch		"入力途中から検索を開始
set ignorecase		"大文字と小文字を区別せずに検索
set smartcase		"検索文字列に大文字があれば区別する
set wrapscan		"検索時、末尾まで行ったら最初に戻る

"keymap
inoremap <Leader>a <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sw <C-w>w

nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT

" dein.vim
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" if not have dein.vim
if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_repo_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" start dein.vim config
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)
	
	" toml file
	let g:rc_dir	=expand('~/.vim/rc')
	let s:toml	=g:rc_dir . '/dein.toml'
	let s:lazy_toml	=g:rc_dir . '/dein_lazy.toml'

	" toml read and cash
	call dein#load_toml(s:toml,	{'lazy': 0})

	" config end
	call dein#end()
	call dein#save_state()
endif

if dein#check_install()
	call dein#install()
endif

colorscheme iceberg
syntax on			"文字のハイライト

let g:lightline = {
	\ 'colorscheme' : 'wombat'
	\ }
