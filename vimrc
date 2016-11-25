 " Quoc Hung Le's .vimrc

" General {{{
" Load Plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

set background=dark                 " Using dark background while writing code
set termguicolors                   " Using True Colors
syntax enable                       " Set syntax on by default
colorscheme onedark                 " A dark Vim color scheme inspired by Atom's One Dark syntax theme.
let g:onedark_terminal_italics = 1  " Enable using italic character
" Set the color of non text characters to be the same as the background color
hi NonText guifg=bg

" Enable using true color in Neovim
" For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

set history=500       " Keep 500 lines of command line history
set ruler             " Show the cursor position all the time
set backspace=2       " Make the backspace work like in most other programs
set clipboard=unnamed " Use the OS clipboard by default
set timeoutlen=500    " Set keypress timeout
set shiftround        " When at 3 spaces, hit >> to go to 4, not 5.
set lazyredraw        " Don't redraw screen when running macros.
set esckeys           " Allow cursor keys in insert mode
set ttyfast           " Optimize for fast terminal connections
set binary            " Don’t add empty newlines at the end of files
set showmatch         " Show matching brackets.
set noerrorbells      " Disable error bells
set nostartofline     " Don’t reset cursor to start of line when moving around.
set diffopt+=vertical " Always use vertical diffs
set autowrite         " Automatically :write before running commands
set scrolloff=10      " Keep at least 10 lines below cursor
set shortmess=atI     " Don’t show the intro message when starting Vim
set showmode          " Show the current mode
set noeol             " No end of line
set title             " Show the filename in the window titlebar
set showcmd           " Show command in bottom bar
set noswapfile        " Stop vim from creating automatic backup ..
set novisualbell      " Do not show visual bell
set nobackup          " Do not backup
set nowb
" }}}

" Presentation {{{
set cursorline      " Highlight current line
set number          " Show line number
set numberwidth=5   " Number column width
set relativenumber  " Set relative number by default
set linebreak       " Wrap lines at convenient points
set wrap            " Wrap text.
set textwidth=81    " Maximum line width before wrapping.
set laststatus=2    " Always display status line
set smartindent     " Smart Indent
set showbreak=a     " Set break character
set scrolloff=10    " Keep at least 5 lines above & below cursor position

" Invisible Characters
set list                                                 " Show invisible characters.
set listchars=tab:▸\ ,eol:↵,trail:⌴,extends:❯,precedes:❮ " List of characters to show instead of whitespace.
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey ctermfg=5

" Highlight > 81 character range
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(120,999),",")

" Highlight SignColum (Gutter)
hi SignColumn ctermfg=bg ctermbg=NONE
hi SignColumn guifg=red guibg=NONE

" Set Fold Column Width
set foldcolumn=0

" Highlight Fold Column
hi FoldColumn ctermfg=darkblue ctermbg=black
hi FoldColumn guifg=#628db8 guibg=NONE

" Folded Line
hi Folded ctermbg=blue ctermfg=white
hi Folded guibg=#628db8 guifg=white

" Highlight the status line
hi StatusLine   ctermfg=darkblue ctermbg=black
hi StatusLine   ctermfg=darkblue ctermbg=black

" Highlight Wildmenu Selected Item
hi WildMenu     ctermfg=white ctermbg=green
hi WildMenu     guifg=white guibg=#6b9c6e

" Hide tilde signs on blank lines
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

" Vertical Split
set fillchars+=vert:│
hi VertSplit guifg=#444444 guibg=NONE

" Set Line Number Width
set nuw=3

" Line highlights
hi GitGutterAdd ctermfg=green ctermbg=NONE
hi GitGutterAdd guifg=#6b9c6e guibg=NONE
" }}}

" Tabs, Spaces & Whitespace {{{
set tabstop=2     " Set tab to equal 2 spaces.
set expandtab     " Expand tabs into spaces.
set smarttab      " Insert spaces in front of lines.
set softtabstop=2 " Set soft tabs equal to 2 spaces.
set modeline
set modelines=1
filetype indent on
filetype plugin on
set autoindent    " Auto indent
set selection=old " Do not select the end of line.
set shiftwidth=2  " Set auto indent spacing.
set shiftround    " Shift to the next round tab stop.
set nojoinspaces  " Use one space, not two, after punctuation.

" Better Whitespace Settings
highlight ExtraWhitespace ctermbg=red guibg=#C80000
" }}}

" Keymapping {{{
" Set leader key
let mapleader=","

" Use HJKL instead of arrow keys
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

" Quickly source .vimrc
map <leader>r :source $MYVIMRC<CR>

" Quickly open .vimrc in new tab
map <leader>v :tabedit ~/.vimrc<CR>

" Quickly open .vimrc.bundles in new tab
map <leader>b :tabedit ~/.vimrc.bundles<CR>

" Quickly quit editting without save
map <leader>q :q!<CR>

" Quickly open .tmux.conf in new tab
map <leader>mx :tabedit ~/.tmux.conf<CR>

" Quick Save
nnoremap <S-s> :w<CR>

" Saves the file (handling the permission-denied error)
cmap w!! w !sudo tee % >/dev/null

" Select all text
noremap vA ggVG

" Toggle Relative Number
nnoremap <silent> <leader>nb :set relativenumber!<CR>

" Toggle Wrap Text
nnoremap <silent> <leader>w :set wrap!<CR>

" Toggle Paste
nnoremap <silent> <leader>p :set paste!<CR>

" CTags
nnoremap <F5> :!ctags -R<CR>

" Start tracking Vim session
map <leader>o :Obsession<CR>

" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" }}}

" Tab Navigation {{{
map <Leader>tn :tabnew<CR>          " Easily create a new tab.
map <Leader>tc :tabclose<CR>        " Easily close a tab.
noremap <Leader>tm :tabmove<CR>     " Easily move a tab.
noremap <Leader>tn :tabnext<CR>     " Easily go to next tab.
noremap <Leader>tp :tabprevious<CR> " Easily go to previous tab.

" Switch between tabs
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" }}}

" UI Layouts & Windows Management {{{
" Windows Managements
" Windows Split
" set winwidth=60
" set winheight=40
" :silent! set winminheight=20
"
"" Creating splits with empty buffers in all directions
nnoremap <Leader>hn :leftabove  vnew<CR>
nnoremap <Leader>ln :rightbelow vnew<CR>
nnoremap <Leader>kn :leftabove  new<CR>
nnoremap <Leader>jn :rightbelow new<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Move between splits faster without the prefix key
" Use ctrl-[hjkl] to select the active split!
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Make tmux navigator works in NeoVim
" https://github.com/christoomey/vim-tmux-navigator#it-doesnt-work-in-neovim-specifically-c-h
" A more complete and less-hacky solution would be to update the incorrect
" terminfo entry that is part of the problem on OS X (and some Linux
" distributions) as described in this comment: https://github.com/neovim/neovim/issues/2048#issuecomment-78045837
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
" }}}

" Search {{{
set hlsearch                             " Enable Highlight Search
set incsearch                            " Highlight while search
set ignorecase                           " Case Insensitivity Pattern Matching
set smartcase                            " Overrides ignorecase if pattern contains upcase
set grepprg=ack\ --nogroup\ --column\ $* " Make grep use ack instead
set grepformat=%f:%l:%c:%m

" Keep search results at the center of screen
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
" }}}

" Foldings {{{
set foldenable        " Enable folding.
set foldmethod=syntax " Syntax dictates folding.
set foldnestmax=10    " Do not nest more than 5 folds.
set foldlevelstart=10 " Open most folds by default
set viewoptions=folds " Remember folds
" }}}

" Misc {{{
" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Pressing ,ss will toggle spell checking
map <leader>ss :setlocal spell!<cr>

" Mouse Settings
if has('mouse')
  set mouse=a " Enable mouse everywhere.
  set mousemodel=popup_setpos  " Show a pop-up for right-click.
  set mousehide " Hide mouse while typing.
endif

" Wildmenu Settings
set wildmenu         " Enhance command-line completion
set wildignorecase   " Ignore casing
set wildchar=<Tab>   " Enable completion on tab.

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" }}}

" Autocommand {{{
if has("autocmd")
  " Run NeoMake on read and write operations
  " au BufReadPost * Neomake
  " au BufWritePost * Neomake

  " Enable file type detection
	au BufWinLeave * silent! mkview
	au BufWinEnter * silent! loadview


	" Resize splits when the window is resized.
	au VimResized * exe "normal! \<c-w>="

" Strip trailing whitespace on save.
	au BufWritePre,FileWritePre,FileAppendPre,FilterWritePre * StripWhitespace

  " Treat .json files as .js
  au BufNewFile,BufRead *.json setfiletype json syntax=javascript
  au BufNewFile,BufRead *.js setfiletype javascript syntax=javascript

" Autoload craft.snippets when editing *.twig files
  au FileType twig UltiSnipsAddFiletypes craft

  " Mardown Settings
  " ============================================================================
  " Set filetype as Github Markdown instead of normal markdown
  au BufNewFile,BufReadPost *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown

  au FileType markdown setlocal spell        " Spellchecking for Markdown
  au FileType markdown setlocal wrap         " Enable text to fit within windows width
  au FileType markdown setlocal linebreak    " Avoid wrap breaking words
  au FileType markdown setlocal nolist       " Make sure linebreak work as expected
  au FileType markdown setlocal showbreak=↳\ " Know where we're
  au FileType markdown setlocal textwidth=0  " Remove text width limit

  " Parse content between the ---s as comment. Make YML files look better
  au BufNewFile,BufReadPost,BufWrite *.{md,mdown,mkd,mkdn,markdown,mdwn} syntax match Comment /\%^---\_.\{-}---$/

  " Remember last position in file
  " au BufReadPost *
  "   \ if line("'\"") > 0 && line("'\"") <= line("$") |
  "   \   exe "normal g`\"" |
  "   \ endif

  " Allow stylesheets to autocomplete hyphenated words
  " au FileType css,scss,sass setlocal iskeyword+=-

  " Code Folding

  " In order for SimpylFold to be properly loaded in certain cases
  " au BufWinLeave *.py setlocal foldexpr< foldmethod<

  " Use Emmet on HTML & CSS only
  au FileType html,css EmmetInstall
  "
endif
" }}}

" Cursor configuration {{{
" ====================================================================
" Use a blinking upright bar cursor in Insert mode, a solid block in normal
" and a blinking underline in replace mode
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  let &t_SI = "\<Esc>[5 q"
  let &t_SR = "\<Esc>[3 q"
  let &t_EI = "\<Esc>[2 q"
" }}}

" Plugin Settings

" ALE  {{{

" Setup linters
let g:ale_linters = {
  \ 'bash':       ['shellcheck'],
  \ 'javascript': ['eslint'],
  \ 'ruby':       ['rubocop'],
  \ 'markdown':   ['mdl'],
  \ 'php':        ['phpcs'],
  \ 'css':        ['csslint'],
  \ 'html':       ['htmlhint'],
  \ 'json':       ['jsonlint'],
  \ 'python':     ['flake8'],
  \ 'sass':       ['sasslint'],
  \ 'scss':       ['scsslint'],
  \ 'viml':       ['vint'],
  \ 'yml':        ['yamllint'],
\ }

" Display waring & erros in airline
let g:airline#extensions#ale#enabled = 1

" Custom Characters
let g:ale_sign_error = '➤'
let g:ale_sign_warning = '⚠'

" Set Error Format
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'

" }}}

" Deoplete {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#sources = {}
let g:deoplete#sources._=['buffer', 'ultisnips', 'file']

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" }}}

" Easy Motion {{{
" Replace default Vim search with EasyMotion n-character search motion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1        " This setting makes EasyMotion work similarly to Vim's smartcase option for global searches
let g:EasyMotion_use_smartsign_us = 1 " With this option set, v will match both v and V, but V will match V only. Default: 0. Works with US layout

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" 2-character search motion
nmap <Leader><Leader>s <Plug>(easymotion-s2)
nmap <Leader><Leader>t <Plug>(easymotion-t2)

" Within line motion
" Every motion also has variants that are restricted to just the current line
" This can be helpful if you find the full search distracting or slows down vim.
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
" }}}

" Easy Align {{{
 " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

"Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" Emmet Vim {{{
let g:user_emmet_mode='a'           " Only enable Insert mode functions.
let g:user_emmet_install_global = 1 " Enable just for html/css
let g:user_emmet_leader_key='<Tab>' " Using Tab to expand
" }}}

" FZF Settings {{{
" Fuzzy-find Files
map  <C-p> :Files<cr>
nmap <C-p> :Files<cr>

" Line matching
imap <c-x><c-l> <plug>(fzf-complete-line)

" Setup  window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }

" This is the default extra key bindings
let g:fzf_action = { 'enter': 'tab split'}

" Customize fzf colors to match your color scheme
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" File preview using Highlight
let g:fzf_files_options =
  \ '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
"
" }}}

" Gitgutter {{{
let g:gitgutter_enabled            = 1
let g:gitgutter_signs              = 1
let g:gitgutter_highlight_lines    = 0
let g:gitgutter_sign_column_always = 1
let g:gitgutter_realtime           = 1
let g:gitgutter_eager              = 0
let g:gitgutter_max_signs          = 500
" }}}

" GoYo {{{
" Automatically turn on Limglight when using Goyo
autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set nolist
  set listchars=
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  NERDTreeTabsClose
  Limelight
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=5
  set list
  set listchars=tab:▸\ ,eol:↵,trail:⌴,extends:❯,precedes:❮
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  NERDTreeTabsOpen
  Limelight!
endfunction
" }}}

" Limelight {{{
" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 3
" }}}

" Indent Guide {{{
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_start_level = 2
let g:indent_guides_default_mapping = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'startify', 'man', 'rogue']
" }}}

" NeoMake {{{
" " Run each enabled maker one after the other.
" let g:neomake_serialize = 1
"
" " Abort after the first error status is encountered
" let g:neomake_serialize_abort_on_error = 1
"
" " Preseve cursor position when quickfix window is open
" let g:neomake_open_list = 0
"
" " The height of quickfix list opened by Neomake
" let g:neomake_list_height = 10
"
" " Shows warning and error counts in vim-airline
" let g:airline#extensions#neomake#enabled = 1
"
" " HTML
" let g:neomake_html_enabled_makers = ['htmlhint']
"
" " CSS & SCSS
" let g:neomake_css_enabled_makers = ['stylelint']
" let g:neomake_sass_enabled_makers = ['stylelint']
" let g:neomake_scss_enabled_makers = ['stylelint']
"
" " Javascript
" let g:neomake_javascript_enabled_makers = ['eslint']
"
" " Ruby
" let g:neomake_ruby_enabled_makers = ['rubocop']
"
" " PHP
" let g:neomake_php_enabled_makers = ['phpcs']
"
" " Markdown
" let g:neomake_markdown_enabled_makers = ['mdl']
" }}}

" NERDTree {{{
" Map Leader F to show file in NERDTree
nmap <Leader>f :NERDTreeFind<CR>
let g:NERDTreeWinSize=30
let g:NERDTreeShowHidden=0
let g:NERDTreeShowLineNumbers=0
let g:NERDTreeMinimalUI=1
let g:NERDTreeCascadeSingleChildDir=0
let g:NERDTreeHighlightCursorline=1

" }}}

" NERDTree Tabs {{{

" Map Leader t to toggle NERDTree
nmap <Leader>t :NERDTreeTabsToggle<CR>

" Run NERDTreeTabs on console vim startup
let g:nerdtree_tabs_open_on_console_startup = 2
"
" Automatically find and select currently opened file in NERDTree.
let g:nerdtree_tabs_autofind = 1
"
" On startup, focus NERDTree if opening a directory, focus file if opening a file. (When set to 2, always focus file window after startup).
let g:nerdtree_tabs_smart_startup_focus = 1
"
" Open NERDTree on new tab creation (if NERDTree was globally opened by :NERDTreeTabsToggle)
let g:nerdtree_tabs_open_on_new_tab = 1

" When switching into a tab, make sure that focus is on the file window, not in the NERDTree window.
let g:nerdtree_tabs_focus_on_files = 1

" }}}

" NERDTres File highlighting {{{
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" HTML
call NERDTreeHighlightFile('jade', 'green', 'none', '#719c6e', 'none')
call NERDTreeHighlightFile('html', 'yellow', 'none', '#f0f0f0', 'none')
call NERDTreeHighlightFile('haml', 'green', 'none', '#719c6e', 'none')

" Shell
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', 'none')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', 'none')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', 'none')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', 'none')

" Programming Languages
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', 'none')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', 'none')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', 'none')
call NERDTreeHighlightFile('rb', 'Magenta', 'none', '#ff00ff', 'none')

" Systems
call NERDTreeHighlightFile('ini', 'yellow', 'none', '#f0f0f0', 'none')
call NERDTreeHighlightFile('config', 'yellow', 'none', '#f0f0f0', 'none')
call NERDTreeHighlightFile('conf', 'yellow', 'none', '#f0f0f0', 'none')
call NERDTreeHighlightFile('yml', 'yellow', 'none', '#f0f0f0', 'none')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', 'none')

" Text
call NERDTreeHighlightFile('json', 'yellow', 'none', '#f0f0f0', 'none')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', 'none')

" CSS
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', 'none')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', 'none')
" }}}

" NERD Commenter {{{
let g:NERDSpaceDelims = 1            " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1        " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'      " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_java = 1         " Set a language to use its alternate delimiters by default
let g:NERDCommentEmptyLines = 1      " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } } " Add your own custom formats or override the defaults
" }}}

" Rainbow Parenthesis {{{
let g:rbpt_colorpairs = [
  \ ['brown',       'RoyalBlue3'],
  \ ['Darkblue',    'SeaGreen3'],
  \ ['darkgray',    'DarkOrchid3'],
  \ ['darkgreen',   'firebrick3'],
  \ ['darkcyan',    'RoyalBlue3'],
  \ ['darkred',     'SeaGreen3'],
  \ ['darkmagenta', 'DarkOrchid3'],
  \ ['brown',       'firebrick3'],
  \ ['gray',        'RoyalBlue3'],
  \ ['black',       'SeaGreen3'],
  \ ['darkmagenta', 'DarkOrchid3'],
  \ ['Darkblue',    'firebrick3'],
  \ ['darkgreen',   'RoyalBlue3'],
  \ ['darkcyan',    'SeaGreen3'],
  \ ['darkred',     'DarkOrchid3'],
  \ ['red',         'firebrick3'],
  \ ]
" }}}

" SplitJoin {{{
"
nmap <Leader>j :SplitjoinJoin<CR>
nmap <Leader>s :SplitjoinSplit<CR>
" }}}

" Utilsnips {{{
" Trigger configuration.
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
" }}}

"Vim Airline {{{
let g:airline_theme='onedark'                     " Set airline theme
let g:airline_powerline_fonts = 1                 " Enable using powerline font
let g:airline#extensions#tabline#enabled = 1      " Enable Tab line
let g:airline#extensions#tmuxline#enabled = 1     " Enable/disable tmuxline integration >
let g:airline#extensions#tabline#fnamemod = ':t'  " Show just the filename
let g:airline#extensions#tabline#show_buffers = 0 " Do not show buffer in tab bar
let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''$'', '''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v ']) "Integration with vim-obsession
" }}}

" Vim Fugitive {{{
" Fix broken syntax highlight in gitcommit files
" (https://github.com/tpope/vim-git/issues/12)
let g:fugitive_git_executable = 'LANG=en_US.UTF-8 git'

nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>gE :Gedit<space>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gR :Gread<space>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gW :Gwrite!<CR>
nnoremap <silent> <leader>gq :Gwq<CR>
nnoremap <silent> <leader>gQ :Gwq!<CR>

function! ReviewLastCommit()
  if exists('b:git_dir')
    Gtabedit HEAD^{}
    nnoremap <buffer> <silent> q :<C-U>bdelete<CR>
  else
    echo 'No git a git repository:' expand('%:p')
  endif
endfunction
nnoremap <silent> <leader>g` :call ReviewLastCommit()<CR>

augroup fugitiveSettings
  autocmd!
  autocmd FileType gitcommit setlocal nolist
  autocmd BufReadPost fugitive://* setlocal bufhidden=delete
augroup END
" }}}

" Vim Javascript {{{
" Enables syntax highlighting for JSDocs.
let g:javascript_plugin_jsdoc = 1

" Concealing characters
let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_this           = "@"
let g:javascript_conceal_return         = "⇚"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_prototype      = "¶"
let g:javascript_conceal_static         = "•"
let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"
" }}}

" Vim Markdown {{{

" Set header folding level
let g:vim_markdown_folding_level = 1

" Set the number of spaces of indent
let g:vim_markdown_new_list_item_indent = 2
"
" Enable TOC window auto-fit
let g:vim_markdown_toc_autofit = 1

" Do not conceal [link text](link url) as just link text
let g:vim_markdown_conceal = 0

" Highlight YAML front matter as used by Jekyll or Hugo.
let g:vim_markdown_frontmatter = 1

" Syntax highlighting for fenced code block
let g:vim_markdown_fenced_languages = ['csharp=cs', 'ruby=rb', 'viml=vim', 'bash=sh']

"}}}

" Vim Markded App {{{
let g:marked_app = "Marked"
" }}}

" Vim Table Mode {{{
let g:table_mode_corner="|"
" }}}

" Other Markdown Settings {{{
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^
" }}}
"
" Vim Peekaboo {{{
let g:peekaboo_window = 'vertical botright 60new' " Default peekaboo window
let g:peekaboo_compact = 0                        " Compact display; do not display the names of the register groups
" let g:peekaboo_delay = 0                          " Delay opening of peekaboo window (in ms. default: 0)
" let g:peekaboo_prefix = '<leader>'                " Prefix for the peekaboo key mapping (default: '')
" let g:peekaboo_ins_prefix = '<c-x>'               " Prefix for CTRL-R insert key mapping (default: '')
" }}}

" Vim Move {{{
let g:move_map_keys = 0
nmap <S-k> <Plug>MoveLineUp
nmap <S-j> <Plug>MoveLineDown
vmap <S-k> <Plug>MoveBlockUp
vmap <S-j> <Plug>MoveBlockDown
" }}}

" vim:foldmethod=marker:foldlevel=0