set nocompatible
filetype off                              " 先关闭文件类型
set rtp+=~/.vim/bundle/vundle             " 将vundle路径添加到插件vim路径
call vundle#rc()                          " 执行Vundle初始化
Bundle 'bling/vim-airline'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/syntastic'
filetype indent plugin on                 " 安装完后打开文件类型
syntax on
set ruler
set list
set listchars=trail:-
   
"---------------alrLine Config--------------
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_exclude_filename = []
let g:Powerline_symbols='fancy'
let g:airline_powerline_fonts=0
let Powerline_symbols='fancy'
let g:bufferline_echo=0
set laststatus=2
"set fillchars+=stl:\ ,stlnc:\

" === tagbar setting =======
let g:tagbar_width = 20      " tagbar's width, default 20
autocmd VimEnter * nested :call tagbar#autoopen(1)  "automate to open tagbar
let g:tagbar_left = 1       " on the left side
nmap <F5> :TagbarToggle<CR>

let g:syntastic_check_on_open=1
let g:syntastic_python_checkers = ['pep8']

filetype plugin on  
autocmd FileType python set omnifunc=pythoncomplete#Complete  
autocmd FileType javascrīpt set omnifunc=javascriptcomplete#CompleteJS  
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags  
autocmd FileType css set omnifunc=csscomplete#CompleteCSS  
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags  
autocmd FileType php set omnifunc=phpcomplete#CompletePHP  
autocmd FileType c set omnifunc=ccomplete#Complete  
   
   
set nocompatible
set backspace=2
let g:python_author = 'sdk1993'
let g:python_email  = 'shangqiufeng2017@163.com'
let g:pydiction_location='/root/.vim/bundle/pydiction/complete-dict'
set cursorline
set autoindent
set tabstop=4  
set shiftwidth=4  
set expandtab  
set t_Co=256  
let g:solarized_termcolors=256  
set background=dark  
colorscheme molokai 
set pastetoggle=<F12>
"Python 注释
function InsertPythonComment()
    exe 'normal'.1.'G'
    let line = getline('.')
    if line =~ '^#!.*$' || line =~ '^#.*coding:.*$'
        return
    endif
    normal O
    call setline('.', '#!/usr/bin/env python')
    normal o
    call setline('.', '# -*- coding:utf-8 -*-')
    normal o
    call setline('.', '#')
    normal o
    call setline('.', '#   Author  :   '.g:python_author)
    normal o
    call setline('.', '#   E-mail  :   '.g:python_email)
    normal o
    call setline('.', '#   Date    :   '.strftime("%y/%m/%d %H:%M:%S"))
    normal o
    call setline('.', '#   Desc    :   ')
    normal o
    call setline('.', '#')
    normal o
    call cursor(9, 1)
endfunction
function InsertCommentWhenOpen()
    if a:lastline == 1 && !getline('.')
        call InsertPythonComment()
    end
endfunc
au FileType python :%call InsertCommentWhenOpen()
au FileType python map <F4> :call InsertPythonComment()<cr>
