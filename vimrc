"Pathogen.vim setup
set nocp
execute pathogen#infect()
" filetype plugin indent on
" syntax enable
" set ignorecase
" set smartcase
" set incsearch
" set tabstop=4
" set expandtab
" set shiftwidth=2
" set smarttab autoindent
" set title
" set vb
" set ruler
" set number
" set hidden
" set laststatus=2
" set wildmode=list:longest,full
" set showmatch
" set mat=5
set statusline=%F@%{fugitive#statusline()}


let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
nnoremap <Leader>d :NERDTreeToggle<Enter> 

" Auto reload vimrc if I just saved vimrc
autocmd bufwritepost .vimrc source $MYVIMRC
autocmd bufwritepost vimrc source $MYVIMRC

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menuone,menu,longest

"Replace tab and eol with special chars to make it more readable
"set listchars=tab:▸\ ,trail:·
"set list

"Background beauty
" colors molokai 

set background=dark
" colorscheme solarized


if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

" set nu
set cindent
" tabedit
syn on
set nocompatible	" Use Vim defaults (much better!)
set bs=2		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

set ic

set cursorline

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " xml, html, xhtml
  autocmd BufRead, BufNewFile  *.java,*.cpp setlocal tabstop=4 softtabstop=4
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif

" if has("cscope")
"    set csprg=/usr/bin/cscope
"    set csto=0
"    set cst
"    set nocsverb
"    " add any database in current directory
"    if filereadable("cscope.out")
"       cs add cscope.out
"    " else add database pointed to by environment
"    elseif $CSCOPE_DB != ""
"       cs add $CSCOPE_DB $TOP
"    endif
"    set csverb
" endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  "hi Normal     guifg=gray guibg=black
  hi Normal     gui=none guifg=gray guibg=black
  hi Visual     gui=none guifg=black guibg=white
  set guioptions-=T
"  set guioptions-=m
"  set guioptions-=r
"  set guioptions-=L
  let &guifont='Source Code Pro medium 11'
  
endif

"if has("gui_running")
"  colorscheme solarized
"endif

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif


" Open and close all the three plugins on the same time
nmap <F8>   :TrinityToggleAll<CR>

" Open and close the srcexpl.vim separately
" nmap <F9>   :TrinityToggleSourceExplorer<CR>

" Open and close the taglist.vim separately
nmap <F12>  :TrinityToggleTagList<CR>
" nmap <C-F12>  :TrinityToggleTagList<CR>

" Open and close the NERD_tree.vim separately
nmap <F11>  :TrinityToggleNERDTree<CR> 

" List Buffers for selection
nmap <F5>  :buffers<CR>:buffer<Space>

" nnoremap <C-]> <Esc>:exe "ptjump " . expand("<cword>")<Esc>

nmap <RightMouse> :po<CR>

nmap <F10> :set softtabstop=4 tabstop=4 shiftwidth=4 expandtab <CR>
" toolbar
" nmap <S-F12> :set guioptions-=m guioptions-=T <CR>
" nmap <C-F12> :set guioptions+=m guioptions+=T<CR>

set mouse=a

let g:miniBufExplModSelTarget = 1
let g:miniBufExplForceSyntaxEnable = 1
set tabstop=8 softtabstop=8
" au filetypedetect FileType xml,html,xhtml set tabstop=2 softtabstop=2
au filetypedetect FileType xml,html,xhtml setlocal tabstop=2 softtabstop=2
au filetypedetect FileType cpp setlocal tabstop=4 softtabstop=4

" --- OmniCppComplete ---
" -- required --
set nocp " non vi compatible mode
filetype plugin on " enable plugins
" -- optional --
" auto close options when exiting insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menu,menuone
" -- configs --
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window

set tags+=~/.vim/tags/stl3.3.tags
set tags+=~/.vim/tags/common.tags


" keymaps
imap <F1> <Esc>

"let GtagsCscope_Auto_Load = 1

au BufNewFile,BufRead COMMIT_EDITMSG set spell
hi clear SpellBad
hi SpellBad cterm=underline
hi clear SpellCap
hi SpellCap cterm=underline
hi clear SpellRare
hi SpellRare cterm=underline
hi clear SpellLocal
hi SpellLocal cterm=underline

"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

let g:pymode_rope_lookup_project = 0



" Indent Python in the Google way.

" setlocal indentexpr=GetGooglePythonIndent(v:lnum)
" 
" let s:maxoff = 50 " maximum number of lines to look backwards.
" 
" function GetGooglePythonIndent(lnum)
" 
"   " Indent inside parens.
"   " Align with the open paren unless it is at the end of the line.
"   " E.g.
"   "   open_paren_not_at_EOL(100,
"   "                         (200,
"   "                          300),
"   "                         400)
"   "   open_paren_at_EOL(
"   "       100, 200, 300, 400)
"   call cursor(a:lnum, 1)
"   let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
"         \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
"         \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
"         \ . " =~ '\\(Comment\\|String\\)$'")
"   if par_line > 0
"     call cursor(par_line, 1)
"     if par_col != col("$") - 1
"       return par_col
"     endif
"   endif
" 
"   " Delegate the rest to the original function.
"   return GetPythonIndent(a:lnum)
" 
" endfunction
" 
" let pyindent_nested_paren="&sw*2"
" let pyindent_open_paren="&sw*2"

let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'

"function! Formatonsave()
"  let l:formatdiff = 1
"  py3f ~/.vim/tags/clang-format.py
"endfunction
"autocmd BufWritePre *.h,*.c,*.cc,*.cpp call Formatonsave()

