let g:plugins_dir = expand($HOME.'/.vim/plugins')

call plug#begin(g:plugins_dir)

Plug 'SirVer/ultisnips'
Plug 'altercation/vim-colors-solarized'
Plug 'cohama/lexima.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'leafgarland/typescript-vim'
Plug 'maralla/completor.vim',        { 'do': 'make js' }
Plug 'nanotech/jellybeans.vim'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-surround'
Plug 'tyru/open-browser-github.vim'
Plug 'tyru/open-browser.vim'
Plug 'w0rp/ale'
Plug 'github/copilot.vim'
Plug 'preservim/vim-indent-guides'

Plug 'elzr/vim-json',                { 'for': 'json' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'js' }
Plug 'maralla/completor-typescript', { 'for': 'typescript' }
Plug 'mattn/emmet-vim',              { 'for': 'html' }
Plug 'mattn/vim-goimports',          { 'for': 'go' }
Plug 'motemen/hatena-vim',           { 'for': 'hatena' }
Plug 'mxw/vim-jsx',                  { 'for': 'js' }
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
  vnoremap <silent> <C-g> :OpenGithubFile<CR>
endif

if s:is_installed('ale')
  let g:ale_linters = { 'javascript': ['eslint', 'flow'] }
  let g:ale_fixers = { 'perl': ['perltidy'] }
  let g:ale_fix_on_save = 1
  let g:ale_statusline_format = ['E%d', 'W%d', '']

  "Search the .perltidyrc file for starting in the current directory and working upwards
  let g:ale_perl_perltidy_options = '-pro=.../.perltidyrc'

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

  if (has("termguicolors"))
    set termguicolors
  endif
endif

if s:is_installed('vim-colors-solarized') && s:is_installed('lightline.vim')
  let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ }
endif

if s:is_installed('vim-markdown')
  "disable folding"
  let g:vim_markdown_folding_disabled = 1
endif

if s:is_installed('vim-goimports')
  let g:goimports = 1
endif

if s:is_installed('vim-easy-align')
  nmap ga <Plug>(EasyAlign)
  xmap ga <Plug>(EasyAlign)
endif

if s:is_installed('vim-indent-guides')
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_start_level = 1
  let g:indent_guides_guide_size = 1

  let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=7
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=7
endif
