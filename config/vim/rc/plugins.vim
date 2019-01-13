let g:plugins_dir = expand($HOME.'/.vim/plugins')

call plug#begin(g:plugins_dir)

Plug 'altercation/vim-colors-solarized'
Plug 'cohama/lexima.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'leafgarland/typescript-vim'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-surround'
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'
Plug 'maralla/completor.vim',        { 'do': 'make js' }
Plug 'nanotech/jellybeans.vim'
Plug 'SirVer/ultisnips'
Plug 'w0rp/ale'

Plug 'mattn/emmet-vim',              { 'for': 'html' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'js' }
Plug 'mxw/vim-jsx',                  { 'for': 'js' }
Plug 'elzr/vim-json',                { 'for': 'json' }
Plug 'plasticboy/vim-markdown',      { 'for': 'markdown' }

call plug#end()

function! s:is_installed(plugin_name)
  let plugins = expand(g:plugins_dir.'/'.a:plugin_name)

  if isdirectory(plugins)
    return 1
  endif

  return 0
endfunction

"set , as <Leader>"
let mapleader = ","

if s:is_installed('lexima.vim')
  inoremap [ []<LEFT>
  inoremap ( ()<LEFT>
  inoremap " ""<LEFT>
  inoremap ' ''<LEFT>
  inoremap ` ``<LEFT>
endif

if s:is_installed('vim-quickrun')
  let g:quickrun_config = {}
  nnoremap <silent> <Leader>q :<C-u>bw! \[quickrun\ output\]<CR>
endif

if s:is_installed('open-browser.vim') && s:is_installed('open-browser-github.vim')
  nnoremap <silent> <C-g> :OpenGithubFile<CR>
  vnoremap <silent> <C-g> :'<,'>OpenGithubFile<CR>
endif

if s:is_installed('ale')
  let g:ale_linters = { 'javascript': ['eslint', 'flow'] }
  let g:ale_statusline_format = ['E%d', 'W%d', '']
  let g:ale_perl_perl_executable = 'env PERL5LIB="./local/lib/perl5" perl'

  nnoremap <silent> <C-k> :ALEPreviousWrap<CR>
  nnoremap <silent> <C-j> :ALENextWrap<CR>
endif

if s:is_installed('ultisnips')
  let g:UltiSnipsExpandTrigger="<C-k>"

  "Since ultisnips overwrites some mappings by default, kill them"
  let g:UltiSnipsJumpForwardTrigger="<nop>"
  let g:UltiSnipsJumpBackwardTrigger="<nop>"

  let g:UltiSnipsSnippetsDir = expand($HOME.'/.vim/snippets')
endif

if s:is_installed('completor.vim')
  inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
  inoremap <expr> <CR>  pumvisible() ? "\<C-y>" : "\<CR>"
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
endif

if s:is_installed('vim-colors-solarized')
  colorscheme solarized
  set background=light
endif

if s:is_installed('vim-colors-solarized') && s:is_installed('lightline.vim')
  let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ }
endif
