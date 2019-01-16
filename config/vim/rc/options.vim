" === General === "

"Use UTF-8"
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,ucs-2le,ucs-2,cp932

"Default file format"
set fileformat=unix

"Recognize a newline character automatically"
set fileformats=unix,dos,mac

"Use OS native clipboard"
if has('clipboard')
  set clipboard=unnamedplus
endif

"Do not create backup file"
set nobackup

"Do not create swap file"
set noswapfile

"Reload files when it changed outeside of Vim"
set autoread

"Do not force to write changes when open another file"
set hidden

"Maximum width of text"
set textwidth=0

"Modernize the function of backspace"
set backspace=indent,eol,start

"Modernize moving the cursor"
set whichwrap=b,s,h,l,<,>,[,]


" === Appearance === "

"Show line number"
set number

"Jump to the matching brace briefly when insert one"
set showmatch

"Prevent multibyte characters layout from collapsing"
if exists('&ambiwidth')
  set ambiwidth=double
endif

"256 colors"
set t_Co=256

"Show 2 status lines"
set laststatus=2

"Do not show mode"
set noshowmode


" === Sound === "

"No visualbell & beep"
set novisualbell
set vb t_vb=


"=== Indent ==="

"Use soft tab"
set expandtab

"1 tab == 2 spaces"
set tabstop=2
set shiftwidth=2
set softtabstop=0
set shiftround
set smarttab

"Indent automatically"
set autoindent


" === Search === "

"Case insensitive search"
set ignorecase

"`set noignorecase` if a pattern contains an uppercase letter"
set smartcase

"Wrap around to the beginning when `search next` reaches end of file"
set wrapscan

"Enable incremental search"
set incsearch

"Highlight all search pattern matches"
set hlsearch
