" Detect openshift ruby
fun! s:DetectRuby()
    if getline(1) == '#!/usr/bin/env oo-ruby'
        set ft=ruby
    endif
endfun

autocmd BufNewFile,BufRead * call s:DetectRuby()
