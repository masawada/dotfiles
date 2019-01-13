" https://twitter.com/ShougoMatsu/status/541718069010128896
if &compatible
  set nocompatible
endif

" clear autocmd
augroup MyAu
  autocmd!
augroup END

function! s:load_rc(file_name)
  let rc_file = expand($HOME.'/.vim/rc/'.a:file_name)

  if filereadable(rc_file)
    execute 'source' escape(rc_file, ' ')
  endif
endfunction

call s:load_rc('options.vim')
call s:load_rc('plugins.vim')
call s:load_rc('mappings.vim')
call s:load_rc('visual.vim')
call s:load_rc('commands.vim')

set secure
