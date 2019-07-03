if has("python3")
endif
set nocompatible

let g:bundle_groups=['general', 'writing', 'programming', 'misc', 'youcompleteme', 'go', 'python', 'javascript', 'scala', 'php', 'ruby', 'html', 'haskell', 'elixir', 'puppet']

set shell=/bin/sh

if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
	inoremap <silent> <C-[>OC <RIGHT>
endif

let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_cpp_checkers = ['cpplint', 'gcc']
let g:syntastic_cpp_cpplint_thres = 1  " 设置 cpplint 的错误级别阈值（默认是 5），级别低于这一设置的不会显示
let syntastic_aggregate_errors = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '!'
let g:syntastic_style_warning_symbol = '?'
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme="luna"
let g:airline_powerline_fonts=1
let g:multi_cursor_next_key='<S-n>'
let g:multi_cursor_skip_key='<S-k>'
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
"let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window = 1         "在右侧窗口中显示

let g:fencview_autodetect = 1

"let g:neocomplcache_enable_at_startup = 1 " New neocomplcache

let c_gnu = 1
let c_space_errors = 1
"let c_no_tab_space_error = 1
let c_no_curly_error = 1   " don't show gcc statement expression ({x, y;}) as error

let g:vim_json_syntax_conceal = 0


let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
	let &tags = &tags . ',' . gitroot . '/.git/tags'
endif

let g:wildfire_objects = {
			\ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip"],
			\ "html,xml" : ["at"],
			\ }


let g:winManagerWindowLayout='FileExplorer'  " winmanager

if !exists('g:leader')
    let mapleader = ','
else
    let mapleader=g:leader
endif

if !exists('g:localleader')
    let maplocalleader = '_'
else
    let maplocalleader=g:localleader
endif


filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle 'VundleVim/Vundle.vim'
Bundle 'vim-scripts/vimprj'
Bundle 'vim-scripts/DfrankUtil'
Bundle 'vim-scripts/indexer.tar.gz'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'spf13/vim-colors'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'jiangmiao/auto-pairs'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'vim-scripts/sessionman.vim'
Bundle 'matchit.zip'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'powerline/fonts'
Bundle 'bling/vim-bufferline'
Bundle 'easymotion/vim-easymotion'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'flazz/vim-colorschemes'
Bundle 'mbbill/undotree'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'vim-scripts/winmanager'
Bundle 'derekwyatt/vim-fswitch'
Bundle 'google/vim-maktaba'
Bundle 'google/vim-codefmt'
Bundle 'bazelbuild/vim-bazel'
Bundle 'bazelbuild/vim-ft-bzl'
"Bundle 'WolfgangMehner/vim-plugins'
Bundle 'mhinz/vim-signify'
Bundle 'tpope/vim-abolish.git'
Bundle 'osyo-manga/vim-over'
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-indent'
Bundle 'gcmt/wildfire.vim'
Bundle 'dyng/ctrlsf.vim'
Bundle 'derekwyatt/vim-protodef'
Bundle 'lilydjwg/fcitx.vim'
Bundle 'suan/vim-instant-markdown'
Bundle 'yegappan/grep'
Bundle 'reedes/vim-litecorrect'
Bundle 'reedes/vim-textobj-sentence'
Bundle 'reedes/vim-textobj-quote'
Bundle 'reedes/vim-wordy'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-commentary'
Bundle 'godlygeek/tabular'
Bundle 'luochen1990/rainbow'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'brookhong/cscope.vim'
Bundle 'airblade/vim-gitgutter'
if executable('ctags')
	Bundle 'majutsushi/tagbar'
endif
Bundle 'vim-scripts/taglist.vim'
Bundle 'Valloric/YouCompleteMe'

if count(g:bundle_groups, 'php')
	Bundle 'spf13/PIV'
	Bundle 'arnaud-lb/vim-php-namespace'
	Bundle 'beyondwords/vim-twig'
endif

if count(g:bundle_groups, 'python')
	" Pick either python-mode or pyflakes & pydoc
	Bundle 'klen/python-mode'
	Bundle 'yssource/python.vim'
	Bundle 'python_match.vim'
	Bundle 'pythoncomplete'
endif

if count(g:bundle_groups, 'javascript')
	Bundle 'elzr/vim-json'
	Bundle 'groenewege/vim-less'
	Bundle 'pangloss/vim-javascript'
	Bundle 'briancollins/vim-jst'
	Bundle 'kchmck/vim-coffee-script'
	Bundle 'marijnh/tern_for_vim'
	Bundle 'maksimr/vim-jsbeautify'
endif

if count(g:bundle_groups, 'scala')
	Bundle 'derekwyatt/vim-scala'
	Bundle 'derekwyatt/vim-sbt'
	Bundle 'xptemplate'
endif

if count(g:bundle_groups, 'haskell')
	Bundle 'travitch/hasksyn'
	Bundle 'dag/vim2hs'
	Bundle 'Twinside/vim-haskellConceal'
	Bundle 'Twinside/vim-haskellFold'
	Bundle 'lukerandall/haskellmode-vim'
	Bundle 'eagletmt/neco-ghc'
	Bundle 'eagletmt/ghcmod-vim'
	Bundle 'Shougo/vimproc.vim'
	Bundle 'adinapoli/cumino'
	Bundle 'bitc/vim-hdevtools'
endif

if count(g:bundle_groups, 'html')
	Bundle 'hail2u/vim-css3-syntax'
	Bundle 'gorodinskiy/vim-coloresque'
	Bundle 'tpope/vim-haml'
	Bundle 'mattn/emmet-vim'
endif

if count(g:bundle_groups, 'ruby')
	Bundle 'tpope/vim-rails'
	let g:rubycomplete_buffer_loading = 1
	"let g:rubycomplete_classes_in_global = 1
	"let g:rubycomplete_rails = 1
endif

if count(g:bundle_groups, 'puppet')
	Bundle 'rodjek/vim-puppet'
endif

if count(g:bundle_groups, 'go')
	"Bundle 'Blackrush/vim-gocode'
	Bundle 'fatih/vim-go'
endif

if count(g:bundle_groups, 'elixir')
	Bundle 'elixir-lang/vim-elixir'
	Bundle 'carlosgaldino/elixir-snippets'
	Bundle 'mattreduce/vim-mix'
endif

if count(g:bundle_groups, 'misc')
	Bundle 'rust-lang/rust.vim'
	Bundle 'tpope/vim-markdown'
	Bundle 'spf13/vim-preview'
	Bundle 'tpope/vim-cucumber'
	Bundle 'cespare/vim-toml'
	Bundle 'quentindecock/vim-cucumber-align-pipes'
	Bundle 'saltstack/salt-vim'
endif

call vundle#end()

filetype plugin indent on
syntax enable
syntax on                   " Syntax highlighting

scriptencoding utf-8
set autoindent                  " Indent at the same level of the previous line
set backspace=indent,eol,start  " Backspace for dummies
set backup                 " Backups are nice ...
"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
set cursorcolumn
set cursorline                  " Highlight current line
set gcr=a:block-blinkon0
"set guioptions-=l
"set guioptions-=L
"set guioptions-=m
"set guioptions-=r
"set guioptions-=R
"set guioptions-=T
set hidden                          " Allow buffer switching without saving
set history=9999                    " Store a ton of history (default is 20)
set hlsearch                    " Highlight search terms
set ignorecase                  " Case insensitive search
set incsearch                   " Find as you type search
set iskeyword-=-                    " '-' is an end of word designator
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set laststatus=2
set linespace=0                 " No extra spaces between rows
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
setlocal foldlevel=100
"set matchpairs+=<:>             " Match, to be used with %
"set mousehide               " Hide the mouse cursor while typing
set mouse=v                 " Automatically enable mouse usage, set mouse = c can copy text from vim when vim was running is ssh
set nocp
set nofoldenable
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
"set nolist
set nowrap                      " Do not wrap long lines
set number                      " Line numbers on
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
"set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
set sessionoptions=blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize
set shiftwidth=4                " Use indents of 4 spaces
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set showmatch                   " Show matching brackets/parenthesis
set showmode                    " Display the current mode
set smartcase                   " Case sensitive when uc present
set smartindent
set softtabstop=4               " Let backspace delete indent
set spell                           " Spell checking on
set splitbelow                  " Puts new split windows to the bottom of the current
set splitright                  " Puts new vsplit windows to the right of the current
set tabpagemax=15               " Only show 15 tabs

set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set wildchar=<Tab> wildcharm=<C-Z>
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set winminheight=0              " Windows can be 0 line high

set encoding=utf-8
set tabstop=4                   " An indentation every four columns
set expandtab
set foldclose=all
"set foldenable                  " Auto fold code
set foldlevelstart=99
set foldmethod=syntax   "manual indent expr syntax diff marker
set foldnestmax=5   " 设置最大折叠深度
set completeopt=longest,menu
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd                 " Show partial commands in status line and. Selected characters/lines in visual mode
"set t_ti= t_te=  离开vim时保留屏幕
set smarttab
set smartcase
set ch=2
set history=10000
set formatoptions+=mM
set cinoptions=:0g0t0(sus
set fencs=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1,big5,euc-jp,euc-kr,utf-8-bom,ucs
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1,big5,euc-jp,euc-kr,utf-8-bom,ucs
"set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set errorformat^=%-GIn\ file\ included\ %.%#

if has('persistent_undo')
    set undofile                " So is persistent undo ...
    set undolevels=10000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

if !exists('g:override_bundles') && filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
	let g:solarized_termcolors=256
	let g:solarized_termtrans=1
	let g:solarized_contrast="normal"
	let g:solarized_visibility="normal"
	color solarized             " Load a colorscheme
	let g:Powerline_colorscheme='solarized'
endif

if count(g:bundle_groups, 'go')
	let g:go_highlight_functions = 1
	let g:go_highlight_methods = 1
	let g:go_highlight_structs = 1
	let g:go_highlight_operators = 1
	let g:go_highlight_build_constraints = 1
	let g:go_fmt_command = "goimports"
	let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
	let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
	au FileType go nmap <leader>s <Plug>(go-implements)
	au FileType go nmap <leader>i <Plug>(go-info)
	au FileType go nmap <leader>e <Plug>(go-rename)
	au FileType go nmap <leader>r <Plug>(go-run)
	au FileType go nmap <leader>b <Plug>(go-build)
	au FileType go nmap <leader>t <Plug>(go-test)
	au FileType go nmap <leader>gd <Plug>(go-doc)
	au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
	au FileType go nmap <leader>co <Plug>(go-coverage)
endif

if count(g:bundle_groups, 'writing')
	augroup textobj_sentence
		autocmd!
		autocmd FileType markdown call textobj#sentence#init()
		autocmd FileType textile call textobj#sentence#init()
		autocmd FileType text call textobj#sentence#init()
	augroup END
endif

if count(g:bundle_groups, 'writing')
	augroup textobj_quote
		autocmd!
		autocmd FileType markdown call textobj#quote#init()
		autocmd FileType textile call textobj#quote#init()
		autocmd FileType text call textobj#quote#init({'educate': 0})
	augroup END
endif

if isdirectory(expand("~/.vim/bundle/PIV"))
	let g:DisableAutoPHPFolding = 1
	let g:PIVAutoClose = 0
endif

if isdirectory(expand("~/.vim/bundle/matchit.zip"))
    let b:match_ignorecase = 1
endif

if isdirectory(expand("~/.vim/bundle/nerdtree"))
    map <C-e> <plug>NERDTreeTabsToggle<CR>
    map <leader>e :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeFind<CR>
    let g:NERDShutUp=1
    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
    let NERDTreeChDirMode=0
    let NERDTreeQuitOnOpen=1
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0
endif

if isdirectory(expand("~/.vim/bundle/tabular"))
    nmap <leader>a& :Tabularize /&<CR>
    vmap <leader>a& :Tabularize /&<CR>
    nmap <leader>a= :Tabularize /^[^=]*\zs=<CR>
    vmap <leader>a= :Tabularize /^[^=]*\zs=<CR>
    nmap <leader>a=> :Tabularize /=><CR>
    vmap <leader>a=> :Tabularize /=><CR>
    nmap <leader>a: :Tabularize /:<CR>
    vmap <leader>a: :Tabularize /:<CR>
    nmap <leader>a:: :Tabularize /:\zs<CR>
    vmap <leader>a:: :Tabularize /:\zs<CR>
    nmap <leader>a, :Tabularize /,<CR>
    vmap <leader>a, :Tabularize /,<CR>
    nmap <leader>a,, :Tabularize /,\zs<CR>
    vmap <leader>a,, :Tabularize /,\zs<CR>
    nmap <leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <leader>a<Bar> :Tabularize /<Bar><CR>
endif

if isdirectory(expand("~/.vim/bundle/sessionman.vim/"))
    nmap <leader>sl :SessionList<CR>
    "nmap <leader>ss :SessionSave<CR>
    nmap <leader>sc :SessionClose<CR>
    " 保存快捷键
    "map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
    map <leader>ss :mksession! my.vim<cr>
    " 恢复快捷键
    "map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>
    map <leader>rs :source my.vim<cr>
endif

if !has('python') && !has('python3')
    let g:pymode = 0
else
    let g:pymode_python = 'python3'
endif

if isdirectory(expand("~/.vim/bundle/python-mode"))
    let g:pymode_lint_checkers = ['pyflakes']
    let g:pymode_trim_whitespaces = 0
    let g:pymode_options = 0
    let g:pymode_rope = 0
endif

if isdirectory(expand("~/.vim/bundle/ctrlp.vim/"))
    let g:ctrlp_working_path_mode = 'ra'
    nnoremap <silent> <D-t> :CtrlP<CR>
    nnoremap <silent> <D-r> :CtrlPMRU<CR>
    let g:ctrlp_custom_ignore = {
    \ 'dir' : '\.git$\|\.hg$\|\.svn$',
                \ 'file' : '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

    if executable('ag')
        let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
    elseif executable('ack-grep')
        let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
    elseif executable('ack')
        let s:ctrlp_fallback = 'ack %s --nocolor -f'
        " On Windows use "dir" as fallback command.
    elseif WINDOWS()
        let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
    else
        let s:ctrlp_fallback = 'find %s -type f'
    endif
    if exists("g:ctrlp_user_command")
        unlet g:ctrlp_user_command
    endif
    let g:ctrlp_user_command = {
    \ 'types': {
                \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                \ },
                \ 'fallback': s:ctrlp_fallback
                \ }

    if isdirectory(expand("~/.vim/bundle/ctrlp-funky/"))
        " CtrlP extensions
        let g:ctrlp_extensions = ['funky']

        "funky
        nnoremap <leader>fu :CtrlPFunky<Cr>
    endif
endif

if isdirectory(expand("~/.vim/bundle/tagbar/"))
    nnoremap <silent> <leader>tt :TagbarToggle<CR> "设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
    " let tagbar_left=1 " 设置 tagbar 子窗口的位置出现在主编辑区的左边
    " let tagbar_width=32 " 设置标签子窗口的宽度
    " let g:tagbar_compact=1 " tagbar子窗口中不显示冗余帮助信息
    " 设置 ctags 对哪些代码标识符生成标签
    let g:tagbar_type_cpp = {
                \ 'kinds' : [
                \ 'c:classes:0:1',
                \ 'd:macros:0:1',
                \ 'e:enumerators:0:0',
                \ 'f:functions:0:1',
                \ 'g:enumeration:0:1',
                \ 'l:local:0:1',
                \ 'm:members:0:1',
                \ 'n:namespaces:0:1',
                \ 'p:functions_prototypes:0:1',
                \ 's:structs:0:1',
                \ 't:typedefs:0:1',
                \ 'u:unions:0:1',
                \ 'v:global:0:1',
                \ 'x:external:0:1'
                \ ],
                \ 'sro'        : '::',
                \ 'kind2scope' : {
                \ 'g' : 'enum',
                \ 'n' : 'namespace',
                \ 'c' : 'class',
                \ 's' : 'struct',
                \ 'u' : 'union'
                \ },
                \ 'scope2kind' : {
                \ 'enum'      : 'g',
                \ 'namespace' : 'n',
                \ 'class'     : 'c',
                \ 'struct'    : 's',
                \ 'union'     : 'u'
                \ }
                \ }

    let g:tagbar_type_go = {
                \ 'ctagstype' : 'go',
                \ 'kinds'     : [
                \ 'p:package',
                \ 'i:imports:1',
                \ 'c:constants',
                \ 'v:variables',
                \ 't:types',
                \ 'n:interfaces',
                \ 'w:fields',
                \ 'e:embedded',
                \ 'm:methods',
                \ 'r:constructor',
                \ 'f:functions'
                \ ],
                \ 'sro' : '.',
                \ 'kind2scope' : {
                \ 't' : 'ctype',
                \ 'n' : 'ntype'
                \ },
                \ 'scope2kind' : {
                \ 'ctype' : 't',
                \ 'ntype' : 'n'
                \ },
                \ 'ctagsbin'  : 'gotags',
                \ 'ctagsargs' : '-sort -silent'
                \ }
endif

if isdirectory(expand("~/.vim/bundle/rainbow/"))
    let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
endif

if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
    nnoremap <silent> <leader>gr :Gread<CR>
    nnoremap <silent> <leader>gw :Gwrite<CR>
    nnoremap <silent> <leader>ge :Gedit<CR>
    " Mnemonic _i_nteractive
    nnoremap <silent> <leader>gi :Git add -p %<CR>
    nnoremap <silent> <leader>gg :SignifyToggle<CR>
endif

if isdirectory(expand("~/.vim/bundle/undotree/"))
    nnoremap <leader>u :UndotreeToggle<CR>
    " If undotree is opened, it is likely one wants to interact with it.
    let g:undotree_SetFocusWhenToggle=1
endif

if isdirectory(expand("~/.vim/bundle/vim-indent-guides/"))
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    "let g:indent_guides_enable_on_vim_startup = 1
    nmap <silent> <leader>in <Plug>IndentGuidesToggle
endif

if isdirectory(expand("~/.vim/bundle/vim-airline-themes/"))
    if !exists('g:airline_theme')
        let g:airline_theme = 'solarized'
    endif
    if !exists('g:airline_powerline_fonts')
        " Use the default set of separators with a few customizations
        let g:airline_left_sep='›'  " Slightly fancier than '>'
        let g:airline_right_sep='‹' " Slightly fancier than '<'
    endif
endif
" }

fun! ToggleFullscreen()
    call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf

function! ToggleBG()
    let s:tbg = &background
    " Inversion
    if s:tbg == "dark"
        set background=light
    else
        set background=dark
    endif
endfunction

if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

if !exists('g:no_autochdir')
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
endif

if !exists('g:no_restore_cursor')
    function! ResCur()
        if line("'\"") <= line("$")
            silent! normal! g`"
            return 1
        endif
    endfunction

    augroup resCur
        autocmd!
        autocmd BufWinEnter * call ResCur()
    augroup END
endif

if !exists('g:no_views')
    " Add exclusions to mkview and loadview
    " eg: *.*, svn-commit.tmp
    let g:skipview_files = [
                \ '\[example pattern\]'
                \ ]
endif

if has('gui_running')
    set guioptions-=T           " Remove the toolbar
    set lines=40                " 40 lines of text instead of 24
    if !exists("g:no_big_font")
        if LINUX() && has("gui_running")
            set guifont=Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14 \
            YaHei\ Hybrid\ 11.5
        elseif OSX() && has("gui_running")
            set guifont=Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
        elseif WINDOWS() && has("gui_running")
            set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
        endif
    endif
else
    if &term == 'xterm' || &term == 'screen'
        set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
    endif
    "set term=builtin_ansi       " Make arrow and other keys work
endif

function! NERDTreeInitAsNeeded()
    redir => bufoutput
    buffers!
    redir END
    let idx = stridx(bufoutput, "NERD_tree")
    if idx > -1
        NERDTreeMirror
        NERDTreeFind
        wincmd l
    endif
endfunction

" Functions {
    " Initialize directories {
    function! InitializeTempDir()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        let common_dir = parent . '/.' . prefix

        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeTempDir()
" }

function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

function! s:RunShellCommand(cmdline)
    botright new
    setlocal buftype=nofile
    setlocal bufhidden=delete
    setlocal nobuflisted
    setlocal noswapfile
    setlocal nowrap
    setlocal filetype=shell
    setlocal syntax=shell
    call setline(1, a:cmdline)
    call setline(2, substitute(a:cmdline, '.', '=', 'g'))
    execute 'silent $read !' . escape(a:cmdline, '%#')
    setlocal nomodifiable
    1
endfunction
command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)

fun! ShowFuncName()
    let lnum = line(".")
    let col = col(".")
    echohl ModeMsg
    echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
    echohl None
    call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun

if !exists('g:no_keyfixes')
    if has("user_commands")
        command! -bang -nargs=* -complete=file E e<bang> <args>
        command! -bang -nargs=* -complete=file W w<bang> <args>
        command! -bang -nargs=* -complete=file Wq wq<bang> <args>
        command! -bang -nargs=* -complete=file WQ wq<bang> <args>
        command! -bang Wa wa<bang>
        command! -bang WA wa<bang>
        command! -bang Q q<bang>
        command! -bang QA qa<bang>
        command! -bang Qa qa<bang>
        command! -bang WQA wqa<bang>
    endif
    cmap Tabe tabe
endif
command! -bang -nargs=? QFix call QFixToggle(<bang>0)

function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
        cclose
        unlet g:qfix_win
    else
        copen
        let g:qfix_win = bufnr("$")
    endif
endfunction

"function! SetLogHighLight()
"    highlight LogFatal ctermbg=red guifg=red
"    highlight LogError ctermfg=red guifg=red
"    highlight LogWarning ctermfg=yellow guifg=yellow
"    highlight LogInfo ctermfg=green guifg=green
"    syntax match LogFatal "^F\d\+ .*$"
"    syntax match LogError "^E\d\+ .*$"
"    syntax match LogWarning "^W\d\+ .*$"
"    " syntax match LogInfo "^I\d\+ .*$"
"endfunction
"autocmd BufEnter *.{log,INFO,WARNING,ERROR,FATAL} nested call SetLogHighLight()


set tags=./tags;/,~/.vimtag
set formatoptions=tcrqn
set csprg=/usr/bin/cscope
set path=$PWD/**
set path+=/usr/include
set path+=/usr/local/include
set tags=./tags;/,~/.vimtags
set tags+=/usr/include/sys.tags
set tags+=/usr/include/c++/7/stdcpp.tags
set tags+=/usr/local/include/local.tags

if isdirectory(expand("~/.vim/bundle/YouCompleteMe/"))
	let g:acp_enableAtStartup = 0
	nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
	nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
	inoremap <leader>, <C-x><C-o>
	let g:ycm_collect_identifiers_from_tags_files = 1
	let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"]
	let g:UltiSnipsExpandTrigger = '<C-j>'
	let g:UltiSnipsJumpForwardTrigger = '<C-j>'
	let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
	let g:ycm_global_ycm_extra_conf = '/root/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
	let g:ycm_min_num_of_chars_for_completion = 1
	let g:ycm_min_num_identifier_candidate_chars = 0
	let g:ycm_server_python_interpreter='/usr/bin/python'
	let g:ycm_auto_trigger = 1
	let g:ycm_log_level = 'debug'
    let g:ycm_show_diagnostics_ui = 0
    let g:ycm_filetype_whitelist = { '*': 1 }
	let g:ycm_filetype_blacklist = {
				\ 'tagbar' : 1,
				\ 'qf' : 1,
				\ 'notes' : 1,
				\ 'markdown' : 1,
				\ 'unite' : 1,
				\ 'text' : 1,
				\ 'vimwiki' : 1,
				\ 'pandoc' : 1,
				\ 'infolog' : 1,
				\ 'mail' : 1
				\}

	let g:ycm_filetype_specific_completion_to_disable = {
				\ 'gitcommit': 1
				\}

	let g:ycm_show_diagnostics_ui = 1
	let g:ycm_error_symbol = '>>'
	let g:ycm_warning_symbol = '>>'
	let g:ycm_enable_diagnostic_signs = 1
	let g:ycm_enable_diagnostic_highlighting = 1
	let g:ycm_echo_current_diagnostic = 1

	let g:ycm_filter_diagnostics = {}

	let g:ycm_always_populate_location_list = 0
	let g:ycm_open_loclist_on_ycm_diags = 1
	let g:ycm_allow_changing_updatetime = 1
	let g:ycm_complete_in_comments = 0
	let g:ycm_complete_in_strings = 1
	let g:ycm_collect_identifiers_from_comments_and_strings = 0
	let g:ycm_collect_identifiers_from_tags_files = 0
	let g:ycm_seed_identifiers_with_syntax = 0
	let g:ycm_add_preview_to_completeopt = 0
	let g:ycm_autoclose_preview_window_after_completion = 0
	let g:ycm_autoclose_preview_window_after_insertion = 0
	let g:ycm_max_diagnostics_to_display = 30
	let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
	let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
	let g:ycm_key_invoke_completion = '<C-Space>'
	let g:ycm_key_detailed_diagnostics = '<leader>d'
	let g:ycm_confirm_extra_conf = 0
	let g:ycm_extra_conf_globlist = []
	let g:ycm_filepath_completion_use_working_dir = 0
	let g:ycm_semantic_triggers =  {
				\   'c' : ['->', '.'],
				\   'cpp' : ['->', '.', '::'],
				\   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
				\             're!\[.*\]\s'],
				\   'ocaml' : ['.', '#'],
				\   'cpp,objcpp' : ['->', '.', '::'],
				\   'perl' : ['->'],
				\   'php' : ['->', '::'],
				\   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
				\   'ruby' : ['.', '::'],
				\   'lua' : ['.', ':'],
				\   'erlang' : [':'],
				\}

	let g:ycm_cache_omnifunc = 1
	let g:ycm_use_ultisnips_completer = 1
	let g:ycm_goto_buffer_command = 'vertical-split'
	let g:ycm_disable_for_files_larger_than_kb = 1000
	let g:ycm_python_binary_path = ''
	let g:ycm_keep_logfiles = 0
	let g:ycm_log_level = 'info'
	let g:ycm_auto_start_csharp_server = 1
	let g:ycm_auto_stop_csharp_server = 1
	let g:ycm_csharp_server_port = 0
	let g:ycm_csharp_insert_namespace_expr = ''

	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
	autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
	autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

	if !executable("ghcmod")
		autocmd BufWritePost *.hs GhcModCheckAndLintAsync
	endif

	if !exists("g:no_conceal")
		if has('conceal')
			set conceallevel=2 concealcursor=i
		endif
	endif

	set completeopt-=preview
endif

if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
    " Selected characters/lines in visual mode
endif

" quickfix settings
if version >= 700
    compiler gcc
endif

if version >= 703
    highlight ColorColumn ctermbg=6
    set colorcolumn=80,100
endif

if version >= 700
    autocmd QuickFixCmdPost * :QFix
endif


nnoremap Y y$
noremap j gj
noremap k gk
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap ? :set hlsearch<cr>?
noremap / :set hlsearch<cr>/
noremap * *:set hlsearch<cr>
cmap cd. lcd %:p:h
cmap cwd lcd %:p:h

map <leader>es :sp %%
map <leader>et :tabe %%
map <leader>ev :vsp %%
map <leader>ew :e %%
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>  " Find merge conflict markers
map zh zH
map zl zL

nmap <leader>man :Man 3 <cword><CR>
nmap <leader>m :wa<CR>:make<CR>:cw<CR>
nmap <leader>tl :TlistOpen <CR>
nmap <leader>tn :tnext<CR>  " 正向遍历同名标签
nmap <leader>tp :tprevious<CR> " 反向遍历同名标签
nnoremap <leader>csa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>csc :call CscopeFind('c', expand('<cword>'))<CR>
nnoremap <leader>csd :call CscopeFind('d', expand('<cword>'))<CR>
nnoremap <leader>cse :call CscopeFind('e', expand('<cword>'))<CR>
nnoremap <leader>csf :call CscopeFind('f', expand('<cword>'))<CR>
nnoremap <leader>csg :call CscopeFind('g', expand('<cword>'))<CR>
nnoremap <leader>csi :call CscopeFind('i', expand('<cword>'))<CR>
nnoremap <leader>css :call CscopeFind('s', expand('<cword>'))<CR>
nnoremap <leader>cst :call CscopeFind('t', expand('<cword>'))<CR>
noremap <leader>bg :call ToggleBG()<CR>
nnoremap <leader>hlb :call g:HtmlBeautify()<CR>
nnoremap <leader>jsb :call g:JsBeautify()<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
nnoremap <leader>sf :CtrlSF<CR>
nnoremap <silent> <leader>q gwip  "format file
cmap w!! w !sudo tee % >/dev/null    " For when you forget to sudo.. Really Write the file.
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
"map <leader>= <C-w>=    "Adjust viewports to the same size"
vnoremap < <gv
vnoremap > >gv
vnoremap . :normal .<CR>
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>  "Map <Leader>ff to display all lines with keyword under cursor and ask which one to jump to
map f :call ShowFuncName() <CR>

nnoremap <silent> <F1> :WMToggle<CR>
map <F1> :CursorHold * silent! exe printf('match Underlined /\<%s\>/', expand('<cword>'))
map <F2> :silent! nohlsearch<CR>    " F2 to search high lights
map <F3> :cp<CR>    " jump to previous building error
map <F4> :cn<CR>    " jump to next building error
map <F5> :Bazel build --copt -ggdb3 --strip=never :all <CR>    " run make command
map <F6> :Bazel clean <CR>   " run make clean command
nnoremap <silent> <F8> :TlistToggle<CR>
nmap <F9> :QFix<CR>  " toggle quickfix window
set pastetoggle=<F10>    " F10 toggle paste mode
map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

if exists('g:clear_search_highlight')
    nmap <silent> <leader>/ :nohlsearch<CR>
else
    nmap <silent> <leader>/ :set invhlsearch<CR>
endif

augroup autoformat_settings    " enable auto format
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType go AutoFormatBuffer gofmt
"  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
"  autocmd FileType python AutoFormatBuffer yapf
augroup END

autocmd BufWritePost $MYVIMRC source $MYVIMRC   "auto load .vimrc
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> if !exists('g:keep_trailing_whitespace') | call StripTrailingWhitespace() | endif
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd FileType haskell setlocal commentstring=--\ %s
autocmd FileType haskell,rust setlocal nospell
autocmd FileType go,c setlocal nolist 
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
"autocmd cursorhold * set nohlsearch
au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
autocmd FileType c,cc,hh,cxx,cpp,h set formatoptions=croqt cindent comments=sr:/*,mb:*,ex:*/,://
autocmd FileType python syn keyword Function self
"autocmd CursorMoved * silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))
highlight LineNr ctermfg=none ctermbg=none guifg=bg guibg=bg
highlight NonText ctermfg=none ctermbg=none guifg=bg guibg=bg
hi SpecialKey  term=bold cterm=bold ctermfg=240 ctermbg=none guifg=Cyan
set background=dark
colorscheme solarized
highlight Text ctermfg=none ctermbg=Black
hi Normal ctermbg=Black
highlight Normal guibg=grey90
highlight Cursor guibg=Green guifg=NONE
highlight NonText guibg=grey80
highlight Constant gui=NONE guibg=grey95
highlight Special gui=NONE guibg=grey95
