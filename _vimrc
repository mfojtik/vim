" We don't want to be 'vi' compatible
set nocompatible

" Favorite map leader used for many shortcuts
let mapleader = ","

" Yanks go on clipboard instead.
set clipboard+=unnamed

syntax on
filetype plugin indent on

" Manage all plugins using Pathogen
call pathogen#infect()

" Format options
"
" t     Auto-wrap text using textwidth
" c     Auto-wrap comments using textwidth, inserting the current comment
"       leader automatically.
" q     Allow formatting of comments with "gq".
" o     Automatically insert the current comment leader after hitting 'o'
" r     Automatically insert the current comment leader after hitting <Enter> in Insert mode.
" n     Automatically create nice looking lists (1., 2.)

set formatoptions=tcqron

" I want to use C indentation, automatically indent and number when editing
" source files

au Filetype ruby,c,python,bash,perl set cindent autoindent number

au BufRead,BufNewFile *.ru set filetype=ruby
au BufRead,BufNewFile Gemfile* set filetype=ruby

" With this you can do 'gf' in Normal mode to jump in Ruby classes within
" current application
set suffixesadd=.rb
set includeexpr+=substitute(v:fname,'s$','','g')

" Enable omnicompletion for Ruby language
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Sorry, but I really don't like those .swp files ;-)
set noswapfile

" Long error messages which require enter drives me crazy...
set shortmess=atIsAo

" Better grep :-)
" TODO: This require to install 'ack' command
set grepprg=ack
set grepformat=%f:%l:%m

" Case insensitive search
set ic

" Highlight search
set hls showmatch

" For some old nostalgy I want to follow the 80 characters per line standard
set textwidth=80

" Silence!
set visualbell

" Sometime is better to use fold :-)
"set foldmethod=indent " fold based on indent
"set foldnestmax=3 " deepest fold is 3 levels
"set nofoldenable " dont fold by default

" I like smart menus with files when opening something
set wildmenu
set wildmode=full
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set completeopt=longest,menuone
set complete=.,w,b,u,t,k


set laststatus=2

function! SL(function)
  if exists('*'.a:function)
    return call(a:function,[])
  else
    return ''
  endif
endfunction

set statusline=[%n]\ %<%.99f\ %h%w%m%r%{SL('CapsLockStatusline')}%y%{SL('fugitive#statusline')}%#ErrorMsg#%{SL('SyntasticStatuslineFlag')}%*%=%-14.(%l,%c%V%)\ %P

" Plugins configurato
let g:HiMtchBrktOn= 1

" Highlight whitespaces
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
autocmd filetype html,xml set listchars-=tab:>.

let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDShutUp = 1
let g:NERDTreeHijackNetrw = 0
let NERDTreeIgnore = ['\.pyc$']

map <leader>d :NERDTreeToggle<CR>

if has("gui")
  set noantialias
  set guioptions=aevAi
  set guioptions-=Ll
  " Shift+Insert
  map  <silent>  <S-Insert>  "+p
  imap <silent>  <S-Insert>  <Esc>"+pa
else
  "set background=dark
  "colorscheme solarized
  "hi Normal ctermbg=black
endif

if has("gui_macvim")
  set guifont=Envy\ Code\ R:h13
  set nolazyredraw
  set nomousehide
  set novisualbell
  set background=dark
  let g:solarized_contrast='high'
  colorscheme solarized
endif

if has("gui_gtk2")
  set background=dark
  let g:solarized_contrast='high'
  colorscheme solarized
  "set guifont=Envy\ Code\ R\ 10
  "set guifont=Envy\ Code\ R\ for\ Powerline\ 10
  set guifont=DejaVu\ Sans\ Mono\ 9
  set nomousehide
  set novisualbell
  set nolazyredraw
end

noremap <D-1> 1gt
noremap <D-2> 2gt
noremap <D-3> 3gt
noremap <D-4> 4gt
noremap <D-5> 5gt
noremap <D-6> 6gt
noremap <D-7> 7gt
noremap <D-8> 8gt
noremap <D-9> 9gt
noremap <D-9> 10gt
noremap <D-S-right> gt
noremap <D-S-left> gT

set t_Co=16

let g:Powerline_symbols = 'fancy'

" experimental
set backspace=indent,eol,start " more powerful backspacing
set listchars=tab:>.,trail:-,extends:>,precedes:<
set nolazyredraw

let g:syntastic_ruby_checker='mri'
let g:syntastic_ruby_exec='/usr/bin/ruby'
let g:syntastic_haml_exec='/usr/bin/haml'
