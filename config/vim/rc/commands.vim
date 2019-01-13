"Set dictionary path automatically"
autocmd MyAu FileType * execute 'setlocal dictionary='.expand($HOME.'/.vim/dict/'.&filetype.'.dict')
