set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start " more powerful backspacing
set listchars=tab:>.,trail:-,extends:>,precedes:<
set suffixesadd=.rb
set includeexpr+=substitute(v:fname,'s$','','g')

" Enable omnicompletion for Ruby language
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
