"Modernize moving the cursor"
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap gj j
nnoremap gk k
vnoremap gj j
vnoremap gk k

"Exec nohlsearch with <Esc> <Esc>"
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

"Prevent page down too far"
nnoremap <expr> <C-f> max([winheight(0) - 2, 1]) . "\<C-d>" . (line('.') > line('$') - winheight(0) ? 'L' : 'H')
