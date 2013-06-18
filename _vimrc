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

" I want to avoid tabs and stick to 2 spaces indentation
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
autocmd FileType python set expandtab! " Python don't like expandtab too much ;-)

" For some old nostalgy I want to follow the 80 characters per line standard
set textwidth=80

" Silence!
set visualbell

" Sometime is better to use fold :-)
set foldmethod=indent " fold based on indent
set foldnestmax=3 " deepest fold is 3 levels
set nofoldenable " dont fold by default

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

if has("balloon_eval") && has("unix")
  set ballooneval
endif

let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDShutUp = 1
let g:NERDTreeHijackNetrw = 0

map <leader>d :NERDTreeToggle<CR>

if has("gui")
  set noantialias
  set lines=52
  set columns=180
  set guioptions=aevAi
  set guioptions-=Ll
else
  set background=dark
  colorscheme solarized
  hi Normal ctermbg=black
endif

if has("gui_macvim")
  set transparency=0
  "set guifont=Monaco:h11
  "set guifont=Pragmata\ TT:h13
  set guifont=Envy\ Code\ R:h13
  set linespace=1
  set background=light
  set nolazyredraw
  let g:solarized_contrast='high'
  colorscheme solarized
endif

if g:colors_name == "railscasts"
  highlight LineNr guifg=#aaaaaa guibg=#242424
  highlight VertSplit guibg=#888888
  highlight StatusLineNC guibg=#888888
endif

let g:pasta_disabled_filetypes = ['python', 'coffee', 'yaml']

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
