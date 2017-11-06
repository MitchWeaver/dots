" Mitch Weaver
"
" https://github.com/MitchWeaver/dotfiles/.vimrc
"
"         ________ ++     ________
"       /VVVVVVVV\++++  /VVVVVVVV\
"       \VVVVVVVV/++++++\VVVVVVVV/
"        |VVVVVV|++++++++/VVVVV/'
"        |VVVVVV|++++++/VVVVV/'
"       +|VVVVVV|++++/VVVVV/'+
"     +++|VVVVVV|++/VVVVV/'+++++
"   +++++|VVVVVV|/VVV___++++++++++
"     +++|VVVVVVVVVV/##/ +_+_+_+_
"       +|VVVVVVVVV___ +/#_#,#_#,\
"        |VVVVVVV//##/+/#/+/#/'/#/
"        |VVVVV/'+/#/+/#/+/#/ /#/
"        |VVV/'++/#/+/#/ /#/ /#/
"        'V/'  /##//##//##//###/
"                ++

" --------------- vundle ------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/vim-plug')
Plug 'vimwiki/vimwiki'
"Plug 'valloric/youcompleteme' " autocompletion
Plug 'kien/ctrlp.vim' " fuzzy finder
Plug 'tpope/vim-commentary' " comment toggler

" Plug 'flazz/vim-colorschemes'

"Plug 'leshill/vim-json' " json support
"Plug 'pangloss/vim-javascript' " better javascript support
"Plug 'tpope/vim-markdown' " markdown support
"Plug 'kchmck/vim-coffee-script' " coffeescript support
"Plug 'octol/vim-cpp-enhanced-highlight' " better cpp syntax

Plug 'sheerun/vim-polyglot' " syntax highlight - all languages

Plug 'suan/vim-instant-markdown' " instant markdown previewer
Plug 'terryma/vim-multiple-cursors' " sublime style multiple selection
Plug 'tpope/vim-surround' " quote/paren etc surrounding

Plug 'altercation/vim-colors-solarized' " solarized colorschemes
Plug 'dracula/vim'  " dracula colorscheme

" Plug 'nathanaelkane/vim-indent-guides'


Plug 'godlygeek/tabular' " text alignment
" Plug 'dylanaraps/wal.vim'
call plug#end()
filetype indent plugin on
syntax enable
" ------------------------------------------------------------------

" ------------- COLORSCHEME ------------------------------------------
colorscheme dracula
" colorscheme solarized
" colorscheme wombat
set background=dark
" set background=light
" --------------------------------------------------------------------

" -------------- Vim Specific Configs --------------------------------
let mapleader=","
set mouse=a " enable mouse support
" ---------------------------------------------------------------------

" ------------ HISTORY ------------------------------------------------
set history=500
set undolevels=500
set undoreload=2000
" --------------------------------------------------------------------

" ---------- UI ------------------------------------------------------
set number " enables line numbers on startup
set ruler " show where you are
" ~~~~~~~~ set relativenumber " shows line numbers relative to position
set tabpagemax=15
set showmode
set showmatch " show matching parens
set cursorline " show current line
set colorcolumn=80

" ---------------------------------------------------------------------

" ------ FORMATTING ---------------------------------------------------
" ~~~~~~~~~  set nowrap " dont wrap lines
set autoindent
set encoding=utf-8
" ----------------------------------------------------------------------

" -------- Tabs and Spacing --------------------------------------------
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " match indents on new lines.
set smartindent " intellegently dedent / indent new lines based on rules
" ----------------------------------------------------------------------

" ---------- File Management -------------------------------------------
set nobackup " we have vcs, we don't need backups.
set nowritebackup " we have vcs, we don't need backups.
set noswapfile " they're just annoying. who likes them?
set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. don't ask.
" ----------------------------------------------------------------------

" ---------- Searching -------------------------------------------------
set ignorecase " case insensitive search
"""set smartcase " if there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.


" ---------------------------------------------------------------------

" -------- Language Syntax Management ---------------------------------
iab #i #include <.h>
" ---------------------------------------------------------------------

" -------- Key Bindings ----------------------------------------------
inoremap <silent><c-n><c-n> <c-o>:set invnumber<cr>
" --------------------------------------------------------------------

" -------------- Extension Settings ----------------------------------

" Set indent guides enabled by default
let g:indent_guides_enable_on_vim_startup = 1
" dont let indent_guides manage colors
" let g:indent_guides_auto_colors = 0

" map the key for toggling comments with vim-commentary
nmap <silent><leader>c :Commentary<CR>

"              Vim Wiki          
let wiki = {}
let g:vimwikidir = "/home/mitch/files/vimwiki"
let wiki.path = g:vimwikidir
let g:vimwiki_list=[wiki]
let g:vimwiki_list = [
                        \{'path': '~/files/vimwiki/personal.wiki', 'syntax': 'markdown', 'ext': '.md'},
                        \{'path': '~/files/vimwiki/philosophy.wiki', 'syntax': 'markdown', 'ext': '.md'},
                        \{'path': '~/files/vimwiki/german.wiki', 'syntax': 'markdown', 'ext': '.md'},
                        \{'path': '~/files/vimwiki/french.wiki', 'syntax': 'markdown', 'ext': '.md'},
                        \{'path': '~/files/vimwiki/programming.wiki', 'syntax': 'markdown', 'ext': '.md'},         
                        \{'path': '~/files/vimwiki/linux.wiki', 'syntax': 'markdown', 'ext': '.md'},         
                        \{'path': '~/files/vimwiki/vim.wiki', 'syntax': 'markdown', 'ext': '.md'}
                    \]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:instant_markdown_autostart = 0	" disable autostart (so it only works on leader command)
map <silent><leader>md :InstantMarkdownPreview<CR>
" ----------------------------------------------------------------

" -------- External Programs -------------------------------------
"Make calcurse notes markdown compatible:
autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown


" Use ranger as a vim file chooser!
function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    if has("gui_running")
        exec 'silent !urxvtc -e ranger --choosefiles=' . shellescape(temp)
    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>r :<C-U>RangerChooser<CR>
" ----------------------------------------------------------------

" #################### END ########################################

" Not sure what these do:
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" set so=10
" set laststatus=2
" let g:Powerline_symbols = 'fancy'
" let g:Powerline_theme = 'solarized256'
" let g:Powerline_theme = 'solarized256'
" let g:Powerline_colorscheme = 'solarized256'
