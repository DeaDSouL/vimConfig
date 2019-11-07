" -----------------------------------------------------------------------------
" |                            Folding help                                   |{{{
" -----------------------------------------------------------------------------
"  Create fold: visual select what you want, then hit: zf
"  Delete folde: go to folded line then hit: zd
"  zo: open fold
"  zc: close fold
"  za: toggle fold
"  zO, zC, zA: same as above, but for all
"  zr: open all folds
"  zm: close all folds

" -----------------------------------------------------------------------------}}}
" |                               vim-plug                                    |{{{
" -----------------------------------------------------------------------------
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
" _____Integration_____
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'               " Git Integration
Plug 'nvie/vim-flake8'                  " [Python]: syntax checker
" ______Markdown_______
"Plug 'suan/vim-instant-markdown'        " Instant Markdown previews from Vim
Plug 'plasticboy/vim-markdown'          " Markdown Syntax

" If you don't have nodejs and yarn
" use pre build
Plug 'godlygeek/tabular' | Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }     " Markdown previews from Vim
" If you have nodejs and yarn
"Plug 'godlygeek/tabular' | Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" _______Writing_______
Plug 'junegunn/limelight.vim'           " Focus on current paragraph by diming the rest
Plug 'junegunn/goyo.vim'                " Remove all distraction, and centering the text
" _____Language_____
Plug 'scrooloose/syntastic'             " syntax checker
Plug 'smancill/conky-syntax.vim'        " conky syntax
" _____Completion_____
Plug 'davidhalter/jedi-vim'             " [Python]: The awesome Python autocompletion with VIM
" _____Code_display_____
Plug 'tmhedberg/SimpylFold'             " [Python]: folding
" _____Interface_____
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/powerline'
Plug 'powerline/fonts'
Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/Zenburn'
Plug 'flazz/vim-colorschemes' 
"Plug 'godlygeek/csapprox'               " Make gvim-only colorschemes work transparently in terminal vim
" _____Misc_____
Plug 'kien/ctrlp.vim'                   " Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'vim-scripts/indentpython.vim'     " [Python]: indent
"Plug 'vimwiki/vimwiki'                  " Personal Wiki for Vim

" Add plugins to &runtimepath
call plug#end()
" Shortcut : update plugins
:noremap ,u :PlugUpdate<CR>
" Shortcut : Upgrade vim-plug
:noremap ,U :PlugUpgrade<CR>

" -----------------------------------------------------------------------------}}}
" |                             Misc Settings                                 | {{{
" -----------------------------------------------------------------------------
syntax on                       " Turn on syntax highlighting
syntax enable
"set spell spelllang=en_us       " [s : next, [s : previous, z= : suggestions
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set number                      " Show line numbers
set matchpairs+=<:>
set vb t_vb=                    " Turn off the bell, this could be more annoying, but I'm not sure how

" -----------------------------------------------------------------------------}}}
" |                              Indenting                                    |{{{
" -----------------------------------------------------------------------------
set tabstop=8       " show existing tab with 4 spaces width
set softtabstop=4
set shiftwidth=4    " when indenting with '>', use 4 spaces width
"set textwidth=79    " ensure your line length doesn’t go beyond 80 characters
set expandtab       " On pressing tab, insert 4 spaces
set autoindent      " Automatically set the indent of a new line (local to buffer)
set si              " smartindent (local to buffer)

" -----------------------------------------------------------------------------}}}
" |                               Folding                                     |{{{
" -----------------------------------------------------------------------------
" Enable folding
set foldmethod=indent   " fold based on indent
set foldnestmax=3       " 99, deepest fold is 3 levels
"set nofoldenable        " don't fold by default
autocmd FileType vim setlocal foldmethod=marker

" -----------------------------------------------------------------------------}}}
" |                              File Stuff                                   |{{{
" -----------------------------------------------------------------------------
" To show current filetype use: set filetype
autocmd FileType html :set filetype=xhtml " we couldn't care less about html
set modeline
filetype plugin indent on
"set fileformat=unix
set encoding=utf-8
set list    " Display tabs and trailing spaces
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
" Set list Chars - for showing characters that are not normally displayed i.e. whitespace, tabs, EOL
"set listchars=trail:.,tab:>-,eol:$
"set nolist

" -----------------------------------------------------------------------------}}}
" |                             Scrollbars                                    |{{{
" -----------------------------------------------------------------------------
set sidescrolloff=7 "2
set scrolloff=3
set sidescroll=1
set numberwidth=4

" -----------------------------------------------------------------------------}}}
" |                               Windows                                     |{{{
" -----------------------------------------------------------------------------
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright
" Shortcuts : Vertical split then hop to new buffer
:noremap ,v :vsp^M^W^W<cr>
:noremap ,h :split^M^W^W<cr>
" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"make Y consistent with C and D
nnoremap Y y$

" -----------------------------------------------------------------------------}}}
" |                          Cursor highlights                                |{{{
" -----------------------------------------------------------------------------
set cursorline
"set cursorcolumn
set showmatch       " Show matching bracets when text indicator is over them

" -----------------------------------------------------------------------------}}}
" |                           Cursor Movement                                 |{{{
" -----------------------------------------------------------------------------
" Make cursor move by visual lines instead of file lines (when wrapping)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge

" -----------------------------------------------------------------------------}}}
" |                              Searching                                    |{{{
" -----------------------------------------------------------------------------
set hlsearch    " highlight search
set incsearch   " incremental search, search as you type
set ignorecase  " Ignore case when searching
set smartcase   " Ignore case when searching lowercase

" -----------------------------------------------------------------------------}}}
" |                            Status Line                                    |{{{
" -----------------------------------------------------------------------------
set showcmd         " Display incomplete commands
set showmode        " Show current mode down the bottom
set ruler           " Show the cursor position all the time
set cmdheight=2     " The commandbar height
" building statusline
set statusline =%#identifier#
set statusline+=[%f]    "tail of the filename
set statusline+=%*
"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*
"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*
" display help
set statusline+=%h      "help file flag
set statusline+=%y      "filetype
"read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*
"modified flag
set statusline+=%#warningmsg#
set statusline+=%m
set statusline+=%*
"fugitive
set statusline+=%{fugitive#statusline()}
"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*
" 
set statusline+=%{StatuslineTrailingSpaceWarning()}
" 
set statusline+=%{StatuslineLongLineWarning()}
" 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*
" 
set statusline+=%=      "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")
        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif
        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

" recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''
        if !&modifiable
            return b:statusline_tab_warning
        endif
        let tabs = search('^\t', 'nw') != 0
        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0
        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        endif
    endif
    return b:statusline_tab_warning
endfunction

"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")
        if !&modifiable
            let b:statusline_long_line_warning = ''
            return b:statusline_long_line_warning
        endif
        let long_line_lens = s:LongLines()
        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                \ '#' . len(long_line_lens) . "," .
                \ 'm' . s:Median(long_line_lens) . "," .
                \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)
    let line_lens = map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
    return filter(line_lens, 'v:val > threshold')
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)
    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction

" -----------------------------------------------------------------------------}}}
" |                            Line Wrapping                                  |{{{
" -----------------------------------------------------------------------------
"set nowrap
set wrap        " Don't wrap lines
"set linebreak  " Wrap lines at convenient points

" -----------------------------------------------------------------------------}}}
" |                              Mappings                                     |{{{
" -----------------------------------------------------------------------------
" Professor VIM says '87% of users prefer jj over esc', jj abrams strongly disagrees
imap jj <Esc>
"imap ,c class 
"imap ,d def 
"imap ,f function 
imap ,s self.
"imap ,t $this->
"imap uu _
"imap hh =>
"imap kk ->

" -----------------------------------------------------------------------------}}}
" |                             Directories                                   |{{{
" -----------------------------------------------------------------------------
set undodir=~/.vim/files/undo       " Setup undo location
set undofile                        " enable backup
set colorcolumn=+1                  " mark the ideal max text width
set backupdir=~/.vim/files/bkp      " Setup backup location
set backup                          " enable backup
set directory=~/.vim/files/swap//   " Set Swap directory
autocmd BufEnter * lcd %:p:h        " Sets path to directory buffer was loaded from

" -----------------------------------------------------------------------------}}}
" |                           Inser New Line                                  |{{{
" -----------------------------------------------------------------------------
" awesome, inserts new line without going into insert mode
map <S-Enter> O<ESC>
map <Enter> o<ESC>
set formatoptions-=o " don't continue comments when pushing o/O

" -----------------------------------------------------------------------------}}}
" |                              Sessions                                     |{{{
" -----------------------------------------------------------------------------
" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
set hidden          " Hide buffers when not displayed
set ttimeoutlen=50  " Solves: there is a pause when leaving insert mode
set history=1000    " store lots of :cmdline history

" -----------------------------------------------------------------------------}}}
" |                                Mouse                                      |{{{
" -----------------------------------------------------------------------------
"behave xterm
"set selectmode=mouse
"set mouse=a " Enable the mouse
"if !has("nvim")
"    set ttymouse=xterm2
"endif

" -----------------------------------------------------------------------------}}}
" |                              Ruby stuff                                   |{{{
" -----------------------------------------------------------------------------
"compiler ruby         " Enable compiler support for ruby
"map <F5> :!ruby %<CR>

" -----------------------------------------------------------------------------}}}
" |                              OS Specific                                  |{{{
" |                       (GUI stuff goes in gvimrc)                          |
" -----------------------------------------------------------------------------
"if has("mac")
    ""
"elseif has("gui_macvim")
    ""
"elseif has("gui_gtk2")
    ""
"elseif has("x11")
    ""
"elseif has("gui_win32")
    ""
"endif

" -----------------------------------------------------------------------------}}}
" |                             GUI Settings                                  |{{{
" -----------------------------------------------------------------------------
" Nice themes:
"   Monokai         vividchalk      xxx
"   Hybrid          murphy          xxx
"   Gruvbox         twilight        xxx
"   jellybeans      ir_black        xxx
"   solarized       zenburn         xxx
if has('gui_running')
    set guioptions-=T       "remove toolbar
    "set guioptions-=m      "remove menu bar
    set background=dark     " Theme
    colorscheme solarized   " Theme
else
    "set t_Co=256            " Tell the term has 256 colors
    colorscheme default
endif

" -----------------------------------------------------------------------------}}}
" |                               NERDTree                                    |{{{
" -----------------------------------------------------------------------------
" Shortcut : toggle NERDTree
map <F9> :NERDTreeToggle<CR>
:noremap ,n :NERDTreeToggle<CR>

" User instead of Netrw when doing an edit /foobar
let NERDTreeHijackNetrw=1
" Single click for everything
let NERDTreeMouseMode=1
let g:NERDTreeMouseMode = 2
let g:NERDTreeWinSize = 40
"let g:NERDTreeChDirMode=2

" Open NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree

" Open a NERDTree automatically when vim starts up if no files were specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Changing default arrows
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'

" Hide .pyc files
"let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" -----------------------------------------------------------------------------}}}
" |                            Omni Completion                                |{{{
" -----------------------------------------------------------------------------
set wildmode=longest:full,full " make cmdline tab completion better
"set wildmode=list:longest   " make cmdline tab completion similar to bash
set wildmenu                " enable ctrl-n and ctrl-p to scroll thru matches
"set wildignore=*.o,*.obj,*~ " stuff to ignore when tab completing
"set omnifunc=syntaxcomplete#Complete

autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType python set omnifunc=pythoncomplete#Complete    " using jedi-vim instead
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete " may require ruby compiled in //DEADSOUL

" -----------------------------------------------------------------------------}}}
" |                           OmniCppComplete                                 |{{{
" -----------------------------------------------------------------------------
"set nocp
" Configure tags - add additional tags here or comment out not-used ones
"set tags+=~/.vim/tags/stl
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
" Build tags of your own project with CTRL+F12
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"noremap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
"inoremap <F12> <Esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
" OmniCppComplete
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_MayCompleteDot = 1
"let OmniCpp_MayCompleteArrow = 1
"let OmniCpp_MayCompleteScope = 1
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview

" -----------------------------------------------------------------------------}}}
" |                             SnippetsEmu                                   |{{{
" -----------------------------------------------------------------------------
"imap <unique> <C-j> <Plug>Jumper
"let g:snip_start_tag = "_\."
"let g:snip_end_tag = "\._"
"let g:snip_elem_delim = ":"
"let g:snip_set_textmate_cp = '1'  " Tab to expand snippets, not automatically.

" -----------------------------------------------------------------------------}}}
" |                         fuzzyfinder_textmate                              |{{{
" -----------------------------------------------------------------------------
map ,f :FuzzyFinderTextMate<CR>
map ,b :FuzzyFinderBuffer<CR>
"let g:fuzzy_ignore = '.o;.obj;.bak;.exe;.pyc;.pyo;.DS_Store;.db'

" -----------------------------------------------------------------------------}}}
" |                            autocomplpop                                   |{{{
" -----------------------------------------------------------------------------
" complete option
"set complete=.,w,b,u,t,k
"let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k'
"set complete=.
let g:AutoComplPop_IgnoreCaseOption = 0
let g:AutoComplPop_BehaviorKeywordLength = 2

" -----------------------------------------------------------------------------}}}
" |                              Jedi-vim                                     |{{{
" -----------------------------------------------------------------------------
" Awesome Python autocompletion with VIM
let g:jedi#documentation_command = "K"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_definitions_command = ""
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = 2 " solve undo-history bug: https://github.com/davidhalter/jedi-vim/issues/313

" -----------------------------------------------------------------------------}}}
" |                             vim-airline                                   |{{{
" -----------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"
set t_Co=256 " to be colorful in tmux

" -----------------------------------------------------------------------------}}}
" |                              SimpylFold                                   |{{{
" -----------------------------------------------------------------------------
"autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
"autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

"  enable previewing of your folded classes' and functions' docstrings in the fold text
"let g:SimpylFold_docstring_preview = 1
" Want to see the docstrings for folded cod
"let g:SimpylFold_docstring_preview = 1
" don't want to see your docstrings folded
"let g:SimpylFold_fold_docstring = 0
" don't want to see your imports folded, add this
"let g:SimpylFold_fold_import = 0

" -----------------------------------------------------------------------------}}}
" |                              syntastic                                    |{{{
" -----------------------------------------------------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let syntastic_stl_format = '[Syntax: %E{line:%fe }%W{#W:%w}%B{ }%E{#E:%e}]'

" -----------------------------------------------------------------------------}}}
" |                               Ctrl-P                                      |{{{
" -----------------------------------------------------------------------------
" Exclude files and directories
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

    " * Press <F5> to purge the cache for the current directory to get new 
    "   files, remove deleted files and apply new ignore options.
    " * Press <c-f> and <c-b> to cycle between modes.
    " * Press <c-d> to switch to filename only search instead of full path.
    " * Press <c-r> to switch to regexp mode.
    " * Use <c-j>, <c-k> or the arrow keys to navigate the result list.
    " * Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or 
    "   in a new split.
    " * Use <c-n>, <c-p> to select the next/previous string in the prompt's 
    "   history.
    " * Use <c-y> to create a new file and its parent directories.
    " * Use <c-z> to mark/unmark multiple files and <c-o> to open them.

"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"  \ 'file': '\v\.(pyc|o|swp|exe|so|dll)$',
"  \ 'link': 'some_bad_symbolic_links',
"  \ }
" Use a custom file listing command:
"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux

" -----------------------------------------------------------------------------}}}
" |                               flake8                                      |{{{
" -----------------------------------------------------------------------------
" Make your python code look pretty
let python_highlight_all=1
let syntastic_python_checkers=['flake8']
"let g:syntastic_python_checkers=['flake8']

" -----------------------------------------------------------------------------}}}
" |                               vimwiki                                     |{{{
" -----------------------------------------------------------------------------
" helppage -> :h vimwiki-syntax
"set nocompatible
" vimwiki with markdown support
"let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" -----------------------------------------------------------------------------}}}
" |                         vim-instant-markdown                              |{{{
" -----------------------------------------------------------------------------
let g:instant_markdown_autostart = 0    " disable autostart
map <leader>md :InstantMarkdownPreview<CR>

" -----------------------------------------------------------------------------}}}
" |                         markdown-preview.nvim                             |{{{
" -----------------------------------------------------------------------------
"  CONFIG {{{
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = $HOME.'/.vim/files/inc/github-markdown.css'

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
" }}}
" MAPPINGS {{{
" normal/insert
" <Plug>MarkdownPreview
" <Plug>MarkdownPreviewStop
" <Plug>MarkdownPreviewToggle
" 
" " example
"nmap <C-s> <Plug>MarkdownPreview
"nmap <M-s> <Plug>MarkdownPreviewStop
"nmap <C-p> <Plug>MarkdownPreviewToggle
" }}}
" COMMANDS {{{
" Start the preview
" :MarkdownPreview
"
" Stop the preview"
" :MarkdownPreviewStop
" }}}

" -----------------------------------------------------------------------------}}}
" |                           LimeLight.vim                                   |{{{
" -----------------------------------------------------------------------------
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" -----------------------------------------------------------------------------}}}
" |                               Startup                                     |
" ----------------------------------- -----------------------------------------


