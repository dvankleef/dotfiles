" Set highlighting on"
:syntax on

" Highlight the current line"
:set cursorline
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
   
filetype plugin indent on   " Automatically detect file types.

set ff=unix

set history=1000                " Store a ton of history (default is 20)
set nu                          " Line numbers on
set showmatch                   " show matching brackets/parenthesis
"set hlsearch                    " highlight search terms
set scrolljump=5                " lines to scroll when cursor leaves screen

colorscheme candy 

" Key (re)Mappings {
    let mapleader = ','

    " Easier moving in tabs and windows
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-L> <C-W>l<C-W>_
    map <C-H> <C-W>h<C-W>_

    " Shortcuts
    " Change Working Directory to that of the current file
    "cmap cwd lcd %:p:h
    "cmap cd. lcd %:p:h
    lcd %:p:h

    map <leader>ff :999winc ><CR>

    " visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

" }


" Formatting {
    set nowrap                      " wrap long lines
    set smartindent
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set softtabstop=4
    "set autoindent                  " indent at the same level of the previous line
    "set shiftwidth=4                " use indents of 4 spaces
    "set expandtab                   " tabs are spaces, not tabs
    "set tabstop=4                   " an indentation every four columns
    "set softtabstop=4               " let backspace delete indent
" }

" Indent guides {
"	let g:indent_guides_start_level = 2
"	let g:indent_guides_guide_size = 1
"	let g:indent_guides_enable_on_vim_startup = 1

"	let g:indent_guides_auto_colors = 0
"	autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"	autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"" }

" Fugitive {
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
"}

if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options
    if has('fugitive')
        set statusline+=%{fugitive#statusline()} "  Git Hotness 
    endif 
    set statusline+=\ [%{&ff}/%Y]            " filetype
    "set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

" Markdown highlighting {
    let g:vim_markdown_folding_disabled=1
"}
