execute pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible
set modelines=1
set background=dark

set encoding=utf-8
"Turn off backups
set nobackup

set cursorline
set relativenumber
set undofile
set backup
"Random vimrc lines
set splitbelow
set splitright
set ttimeout
set notimeout
set nottimeout
set shiftround

" set up tab stops
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

"set hidden
set hidden
set title
set shortmess=atI

"Set up search behaviour
set hlsearch
set ignorecase
set smartcase
set showmatch

" Not sure why these aren't in sensible
nnoremap j gj
nnoremap k gk

" All about the awesome
au FocusLost * silent! wall

if has("win32")
    set undodir=~/vimundodir
    set backupdir=~/vimbackupdir
    set directory=~/vimswpdir
    cabbr jobsdir c:\users\felix ingram\documents\jobs
    cabbr devdir c:\users\felix ingram\documents\development
    cabbr wikipages c:\users\felix ingram\documents\wiki_pages
    cabbr virtenv c:\users\felix ingram\virtualenv
    cabbr blog C:\Users\Felix Ingram\Documents\Personal\blog\stupentest
    cabbr hostsfile C:\Windows\System32\drivers\etc\hosts
else
    set undodir=~/.vimundodir
    set backupdir=~/.vimbackupdir
    set directory=~/.vimswpdir
endif

let mapleader = ","
colorscheme jellybeans

" Search for highlighted text
vnoremap <silent> g/ y/<C-R>=substitute(escape(@", '\\/.*$^~[]'),'\n','\\n','g')<CR><CR>

" Edit vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Clear highlights
nnoremap <leader><space> :noh<cr>

" Tidy up Gvim a little
if has("gui_running")
    if has("win32")
        let g:airline_powerline_fonts = 1 
        "set guifont=Courier_New:h10:cANSI
        "set guifont=Monaco:h10:cANSI
        "set guifont=Inconsolata:h10:cANSI
        "set guifont=Consolas:h10:cANSI
        set guifont=Source_Code_Pro_Medium:h10:cANSI
        if !exists("g:first_load")
            set columns=160
            set lines=40
            let g:first_load=1
        endif
    else
        " < <set guifont=Monaco:h10:cANSI
        "set guifont=DejaVu_Sans_Mono:h10:cANSI
        "set guifont=Ubuntu_Mono:h12:cANSI
        set guifont=Ubuntu\ Mono\ 12
        "set guifont=Anonymous_Pro:h10:cANSI
        "set guifont=Inconsolata:h14
        "set guifont=Courier\ New
        "set guifont=ProggyCleanTT:h12
    endif
    set go-=T
    set go-=t
    set go-=l
    set go-=L
    set go-=r
    set go-=R
    "set go-=m
    set go-=e
    set showtabline=2
    nnoremap <C-Tab> :tabnext<cr>
    nnoremap <C-S-Tab> :tabprev<cr>
    inoremap <S-Insert> <ESC>:setl paste<CR>gi<C-R>+<ESC>:setl nopaste<CR>gi
else
    "In the console
"    if has("win32")
"        colorscheme pyte
"    else
"        let &t_Co=256
"        set t_ti=ESC7ESC[rESC[?47h t_te=ESC[?47lESC8
"        if has("terminfo")
"            let &t_Sf="\ESC[3%p1%dm"
"            let &t_Sb="\ESC[4%p1%dm"
"        else
"            let &t_Sf="\ESC[3%dm"
"            let &t_Sb="\ESC[4%dm"
"        endif
"    endif
"    set nocursorline
    if has("win32")
        set background=light
    endif
endif

if has("autocmd")
    autocmd! bufwritepost .vimrc source $MYVIMRC
    autocmd! bufwritepost _vimrc source $MYVIMRC
    autocmd FileType rst set spell
    autocmd FileType markdown set spell
    autocmd FileType hgcommit set spell
    autocmd FileType hgcommit set formatoptions+=t
    autocmd FileType gitcommit set spell
    autocmd FileType gitcommit set formatoptions+=t
    autocmd FileType javascript setlocal tabstop=2
    autocmd FileType javascript setlocal shiftwidth=2
    autocmd FileType javascript setlocal expandtab
    autocmd FileType javascript setlocal softtabstop=2
    autocmd BufRead *.vue setf html
endif

" Syntastic stuff
let g:syntastic_javascript_checkers = ['standard'] 
let g:syntastic_python_checkers = ['flake8'] 

"Set up Putty stuff on Windows
let g:netrw_scp_cmd = 'c:\Progra~2\PuTTY\pscp.exe -q -batch'
let g:netrw_list_cmd = 'c:\Progra~2\PuTTY\plink.exe HOSTNAME ls -Fa'
let g:netrw_sftp_cmd= 'c:\Progra~2\PuTTY\psftp.exe'


"CD to my dir
nnoremap <Leader>fi :cd \Users\Felix\ Ingram\Documents\<CR>
nnoremap <Leader>cdd :cd \Users\Felix\ Ingram\Desktop\<CR>

"Highlight the current word without jumping
nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
