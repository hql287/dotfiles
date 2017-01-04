" Quoc Hung Le's .vimrc

" General {{{
" Load Plugins
if filereadable(expand('~/.vimrc.bundles'))
  source ~/.vimrc.bundles
endif

set background=dark                 " Using dark background while writing code
set termguicolors                   " Using True Colors
syntax enable                       " Set syntax on by default
colorscheme onedark                 " A dark Vim color scheme inspired by Atom's One Dark syntax theme.
let g:onedark_terminal_italics = 1  " Enable using italic character

" Enable using true color in Neovim
" For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" Render all comments in italic
highlight Comment gui=italic

" Special highlighting for HTML
" HTML arguments such as id, class, attribute
highlight htmlArg gui=italic
highlight xmlAttrib gui=italic

" HTML title
highlight htmlTitle gui=italic
" HTML anchor
highlight htmlLink gui=italic

" XML highlight
" highlight xmlEndTag gui=italic
" highlight xmlTag gui=italic
" highlight xmlTagName gui=italic
" highlight xmlString gui=italic

" Special highlighting for Javascript
" Identifier
highlight javaScriptIdentifier gui=italic
" This keyword
highlight jsThis gui=italic
" Undefined keyword
highlight jsUndefined gui=italic
" Reserved words
highlight javaScriptReserved gui=italic
" Null
highlight javaScriptNull gui=italic
" Numbers
highlight javaScriptNumber gui=italic
" Function Arguments
highlight javaScriptFuncArg gui=italic
" Function Keyword
highlight javaScriptFuncKeyword gui=italic
" hi jsxKeywords gui=italic


set autowrite         " Automatically :write before running commands
set backspace=2       " Make the backspace work like in most other programs
set binary            " Don’t add empty newlines at the end of files
set clipboard=unnamed " Use the OS clipboard by default
set diffopt+=vertical " Always use vertical diffs
set esckeys           " Allow cursor keys in insert mode
set hidden            " Hide files with unwritten changes instead of closing them
set history=500       " Keep 500 lines of command line history
set lazyredraw        " Don't redraw screen when running macros.
set nobackup          " Do not backup
set noendofline       " No end of line
set noerrorbells      " Disable error bells
set nostartofline     " Don’t reset cursor to start of line when moving around.
set noswapfile        " Stop vim from creating automatic backup ..
set novisualbell      " Do not show visual bell
set nowritebackup     " Do not write backup
set ruler             " Show the cursor position all the time
set scrolloff=10      " Keep at least 10 lines below cursor
set shiftround        " When at 3 spaces, hit >> to go to 4, not 5.
set shortmess=atI     " Don’t show the intro message when starting Vim
set showcmd           " Show command in bottom bar
set showmatch         " Show matching brackets.
set showmode          " Show the current mode
set timeoutlen=500    " Set keypress timeout
set title             " Show the filename in the window titlebar
set ttyfast           " Optimize for fast terminal connections
" }}}

" Presentation {{{
filetype indent on " Turn on indent based on filetype
filetype plugin on " Enable plugins based on filetype
set autoindent     " Auto indent
set cursorline     " Highlight current line
set expandtab      " Expand tabs into spaces.
set laststatus=2   " Always display status line
set linebreak      " Wrap lines at convenient points
set modeline       " Enable modeline
set modelines=1
set nojoinspaces   " Use one space, not two, after punctuation.
set number         " Show line number
set numberwidth=5  " Number column width
set relativenumber " Set relative number by default
set scrolloff=10   " Keep at least 5 lines above & below cursor position
set selection=old  " Do not select the end of line.
set shiftround     " Shift to the next round tab stop.
set shiftwidth=2   " Set auto indent spacing.
set showbreak=a    " Set break character
set smartindent    " Smart Indent
set smarttab       " Insert spaces in front of lines.
set softtabstop=2  " Set soft tabs equal to 2 spaces.
set tabstop=2      " Set tab to equal 2 spaces.
set textwidth=81   " Maximum line width before wrapping.
set wrap           " Wrap text.

" Set Line Number Width
set numberwidth=3

" Invisible Characters
set list               " Show invisible characters.
set listchars=tab:▸\   " Tab
set listchars+=eol:¬   " End of line
set listchars+=trail:· " Invisible space"
set listchars+=extends:»
set listchars+=precedes:«

" Better Whitespace Settings
highlight ExtraWhitespace ctermbg=red guibg=#e74c3c

" Set the color of non text characters to be the same as the background color
highlight NonText guifg=bg

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey ctermfg=5

" Highlight > 81 character range
let &colorcolumn=join(range(81,999),',')
let &colorcolumn='80,'.join(range(120,999),',')

" Highlight SignColum (Gutter)
highlight SignColumn ctermfg=bg ctermbg=NONE
highlight SignColumn guifg=red guibg=NONE

" Highlight the status line
highlight StatusLine ctermfg=darkblue ctermbg=black
highlight StatusLine ctermfg=darkblue ctermbg=black

" Hide tilde signs on blank lines
highlight! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

" Vertical Split
set fillchars+=vert:│
highlight VertSplit guifg=#444444 guibg=NONE

" Line highlights
highlight GitGutterAdd ctermfg=green ctermbg=NONE
highlight GitGutterAdd guifg=#27ae60 guibg=NONE
" }}}

" Keymapping {{{
" Set leader key
let g:mapleader=','

" Quickly source .vimrc
nnoremap <leader>r :source $MYVIMRC<CR>

" Quickly open .vimrc in new tab
nnoremap <leader>v :tabedit ~/.vimrc<CR>

" Quickly open .vimrc.bundles in new tab
nnoremap <leader>b :tabedit ~/.vimrc.bundles<CR>

" Quickly quit editting without save
nnoremap <leader>q :q!<CR>

" Quickly open .tmux.conf in new tab
nnoremap <leader>mx :tabedit ~/.tmux.conf<CR>

" Start tracking Vim session
nnoremap <leader>o :Obsession<CR>

" Quickly put double quotes around a word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" Saves the file (handling the permission-denied error)
cnoremap w!! w !sudo tee % >/dev/null

" Delete current line n insert mode
inoremap <c-d> <esc>ddi

" Uppercase current word
inoremap <c-u> <esc>viwUA

" Map JK to ESC
inoremap jk <esc>

" Disable Esp Key
inoremap <esc> <nop>

" Use HJKL instead of arrow keys
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

" Make j and k move to the next row, not file line
nnoremap j gj
nnoremap k gk

" Select all text
nnoremap vA ggVG

" Home & End should be placed next to each other
nnoremap - $

" Quick Save
nnoremap <S-s> :w<CR>

" Don't lose selection when shifting sidewards
" xnoremap <  <gv
" xnoremap >  >gv

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" Yank to end of line
nnoremap Y y$

"Delete to the end of line
nnoremap D d$

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Toggle Relative Number
nnoremap <silent> <leader>nb :set relativenumber!<CR>

" Toggle Wrap Text
nnoremap <silent> <leader>w :set wrap!<CR>

" Toggle Paste
nnoremap <silent> <leader>p :set paste!<CR>

" CTags
nnoremap <F5> :!ctags -R<CR>

" Operator-Pending Mappings

" Inside next paranthesis
onoremap in( :<c-u>normal! f(vi(<cr>

" Inside prev paranthesis
onoremap il( :<c-u>normal! F)vi(<cr>

" Quickly add empty lines
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" Markdown Settings
vnoremap <D-j> gj
vnoremap <D-k> gk
vnoremap <D-4> g$
vnoremap <D-6> g^
vnoremap <D-0> g^
nnoremap <D-j> gj
nnoremap <D-k> gk
nnoremap <D-4> g$
nnoremap <D-6> g^
nnoremap <D-0> g^
" }}}

" Tab Navigation {{{
" Easily create a new tab.
noremap <Leader>tn :tabnew<CR>

" Easily close a tab.
noremap <Leader>tc :tabclose<CR>

" Easily move a tab.
noremap <Leader>tm :tabmove<CR>

" Easily go to next tab.
noremap <Leader>tn :tabnext<CR>

" Easily go to previous tab.
noremap <Leader>tp :tabprevious<CR>

" Switch between tabs
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nnoremap <Leader>tl :exe "tabn ".g:lasttab<CR>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" }}}

" UI Layouts & Windows Management {{{
"
" Creating splits with empty buffers in all directions
nnoremap <Leader>hn :leftabove  vnew<CR>
nnoremap <Leader>ln :rightbelow vnew<CR>
nnoremap <Leader>kn :leftabove  new<CR>
nnoremap <Leader>jn :rightbelow new<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Move between splits faster without the prefix key
" Use ctrl-[hjkl] to select the active split!
nmap <C-j> <C-W><C-j>
nmap <C-k> <C-W><C-k>
nmap <C-l> <C-W><C-l>
nmap <C-h> <C-W><C-h>
" Make tmux navigator works in NeoVim
" https://github.com/christoomey/vim-tmux-navigator#it-doesnt-work-in-neovim-specifically-c-h
" A more complete and less-hacky solution would be to update the incorrect
" terminfo entry that is part of the problem on OS X (and some Linux
" distributions) as described in this comment: https://github.com/neovim/neovim/issues/2048#issuecomment-78045837
nmap <silent> <BS> :TmuxNavigateLeft<cr>
" }}}

" Search {{{
set hlsearch                             " Enable Highlight Search
set incsearch                            " Highlight while search
set ignorecase                           " Case Insensitivity Pattern Matching
set smartcase                            " Overrides ignorecase if pattern contains upcase
set grepprg=ack\ --nogroup\ --column\ $* " Make grep use ack instead
set grepformat=%f:%l:%c:%m

" Keep search results at the center of screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Disable highlight when <leader><cr> is pressed
noremap <silent> <leader><cr> :noh<cr>
" }}}

" Foldings {{{
set foldcolumn=2      " Set Fold Column Width
set foldenable        " Enable folding.
set foldlevelstart=10 " Open most folds by default
set foldmethod=manual " Manually create folds.
set foldnestmax=10    " Do not nest more than 5 folds.
set viewoptions=folds " Remember folds

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Highlight Fold Column
highlight FoldColumn ctermfg=darkblue ctermbg=black
highlight FoldColumn guifg=#2980b9 guibg=NONE

" Highlight Folded Line
highlight Folded ctermbg=blue ctermfg=white
highlight Folded guibg=#2980b9 guifg=white

" }}}

" Functions {{{
" GoYo
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

" Autocommand {{{
augroup general
  autocmd!
  autocmd BufReadPost * Neomake
  autocmd BufWritePost * Neomake

  " Show cursorline only in active windows & not in inser mode
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline

  " Enable file type detection
	autocmd BufWinLeave * silent! mkview
	autocmd BufWinEnter * silent! loadview

	" Resize splits when the window is resized.
	autocmd VimResized * exe "normal! \<c-w>="

" Strip trailing whitespace on save.
	autocmd BufWritePre,FileWritePre,FileAppendPre,FilterWritePre * StripWhitespace

  autocmd TabLeave * let g:lasttab = tabpagenr()
augroup END

augroup ft_json
  autocmd!

  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  autocmd BufNewFile,BufRead *.js setfiletype javascript syntax=javascript
augroup END

augroup ft_vim
  autocmd!

  " Vim settings
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal foldlevelstart=0
  autocmd FileType vim setlocal foldlevel=0
augroup END

augroup ft_html_css_craft
  autocmd!

  " Use Emmet on HTML & CSS only
  autocmd FileType html,css EmmetInstall

  " Autoload craft.snippets when editing *.twig files
  autocmd FileType twig UltiSnipsAddFiletypes craft
augroup END

augroup ft_md
  autocmd!

  " Set filetype as markdown
  autocmd BufNewFile,BufReadPost *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown

  autocmd FileType markdown setlocal spell             " Spellchecking for Markdown
  autocmd FileType markdown setlocal wrap              " Enable text to fit within windows width
  autocmd FileType markdown setlocal linebreak         " Avoid wrap breaking words
  autocmd FileType markdown setlocal nolist            " Make sure linebreak work as expected
  autocmd FileType markdown setlocal showbreak=↳\      " Know where we're
  autocmd FileType markdown setlocal textwidth=0       " Remove text width limit
  autocmd FileType markdown setlocal foldmethod=manual " Manually fold

  " Parse content between the ---s as comment. Make YML files look better
  autocmd BufNewFile,BufReadPost,BufWrite *.{md,mdown,mkd,mkdn,markdown,mdwn} syntax match Comment /\%^---\_.\{-}---$/
augroup END

augroup goyo
  autocmd!

  " Automatically turn on Limglight when using Goyo
  autocmd User GoyoEnter call <SID>goyo_enter()
  autocmd User GoyoLeave call <SID>goyo_leave()
augroup END
" }}}

" Cursor configuration {{{
" ====================================================================
" Change cursor style dependent on mode
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
elseif empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  if v:version >= 800
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  endif
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  if v:version >= 800
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  endif
endif

" }}}

" Wildmenu {{{
set wildmenu         " Enhance command-line completion
set wildignorecase   " Ignore casing
set wildchar=<Tab>   " Enable completion on tab.

" Ignore compiled files
set wildignore=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

" Highlight Wildmenu Selected Item
highlight WildMenu ctermfg=white ctermbg=green
highlight WildMenu guifg=white guibg=#27ae60

if has('nvim') || v:version >= 800
  set completeopt+=noselect
endif
" }}}

" Misc {{{
" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Pressing ,ss will toggle spell checking
noremap <leader>ss :setlocal spell!<cr>

" Mouse Settings
if has('mouse')
  set mouse=a " Enable mouse everywhere.
  set mousemodel=popup_setpos  " Show a pop-up for right-click.
  set mousehide " Hide mouse while typing.
endif
" }}}

" Plugin Settings

" ALE  {{{
" Setup linters
" let g:ale_linters = {
"   \ 'bash':       ['shellcheck'],
"   \ 'javascript': ['eslint'],
"   \ 'ruby':       ['rubocop'],
"   \ 'markdown':   ['mdl'],
"   \ 'php':        ['phpcs'],
"   \ 'css':        ['csslint'],
"   \ 'html':       ['htmlhint'],
"   \ 'json':       ['jsonlint'],
"   \ 'python':     ['flake8'],
"   \ 'sass':       ['sasslint'],
"   \ 'scss':       ['scsslint'],
"   \ 'viml':       ['vint'],
"   \ 'yml':        ['yamllint'],
" \ }
"
" " Display waring & erros in airline
" let g:airline#extensions#ale#enabled = 1
" let g:ale_statusline_format = ['E:%d', 'W:%d', '✓']
"
" " Custom Characters
" let g:ale_sign_error = '➤'
" let g:ale_sign_warning = '⚠'
"
" " Set Error Format
" let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'
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
" This setting makes EasyMotion work similarly to Vim's smartcase option for global searches
let g:EasyMotion_smartcase = 1

" With this option set, v will match both v and V, but V will match V only. Default: 0. Works with US layout
let g:EasyMotion_use_smartsign_us = 1

" Replace default Vim search with EasyMotion n-character search motion
nmap  / <Plug>(easymotion-sn)

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
noremap  <C-p> :Files<cr>
nnoremap <C-p> :Files<cr>

" Line matching
inoremap <c-x><c-l> <plug>(fzf-complete-line)

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

" Neomake {{{

" let g:neomake_verbose                    = 3  " Debug
let g:neomake_serialize                  = 1  " Run each enabled maker one after the other.
let g:neomake_serialize_abort_on_error   = 1  " Abort after the first error status is encountered
let g:neomake_open_list                  = 0  " Preseve cursor position when quickfix window is open
let g:neomake_list_height                = 10 " The height of quickfix list opened by Neomake
let g:airline#extensions#neomake#enabled = 1  " Shows warning and error counts in vim-airline

" Define maker
let g:neomake_bash_enabled_markers      = ['shellcheck'] " Shell
let g:neomake_css_enabled_makers        = ['stylelint']  " CSS
let g:neomake_html_enabled_makers       = ['htmlhint']   " HTML
let g:neomake_javascript_enabled_makers = ['eslint']     " Javascript
let g:neomake_json_enabled_markers      = ['jsonlint']   " Json
let g:neomake_jsx_enabled_makers        = ['eslint']     " Jsx
let g:neomake_markdown_enabled_makers   = ['mdl']        " Markdown
let g:neomake_php_enabled_makers        = ['phpcs']      " PHP
let g:neomake_python_enabled_markers    = ['flake8']     " Python
let g:neomake_ruby_enabled_makers       = ['rubocop']    " Ruby
let g:neomake_sass_enabled_makers       = ['stylelint']  " SASS
let g:neomake_scss_enabled_makers       = ['stylelint']  " SCSS
let g:neomake_swift_enabled_makers      = ['swiftlint']  " Swift
let g:neomake_viml_enabled_markers      = ['vint']       " Viml
let g:neomake_yml_enabled_markers       = ['yamllint']   " Yaml
let g:neomake_zsh_enabled_markers       = ['shellcheck'] " Shell

" Custom sign character
let g:neomake_error_sign = {
  \ 'text': '✗',
  \ 'texthl': 'NeomakeErrorSign'
  \ }
let g:neomake_warning_sign = {
  \ 'text': '⚠',
  \ 'texthl': 'NeomakeWarningSign',
  \ }
let g:neomake_message_sign = {
  \ 'text': '➤',
  \ 'texthl': 'NeomakeMessageSign',
  \ }
let g:neomake_info_sign = {
  \ 'text': 'ℹ',
  \ 'texthl': 'NeomakeInfoSign'
  \ }
" }}}

" NERDTree {{{
" Map Leader F to show file in NERDTree
nnoremap <Leader>f :NERDTreeFind<CR>
let g:NERDTreeWinSize=30
let g:NERDTreeShowHidden=0
let g:NERDTreeShowLineNumbers=0
let g:NERDTreeMinimalUI=1
let g:NERDTreeCascadeSingleChildDir=0
let g:NERDTreeHighlightCursorline=1
" let g:NERDTreeChDirMode=0
" }}}

" NERDTree Tabs {{{

" Map Leader t to toggle NERDTree
nnoremap <Leader>t :NERDTreeTabsToggle<CR>

" Run NERDTreeTabs on console vim startup
let g:nerdtree_tabs_open_on_console_startup = 2
"
" Automatically find and select currently opened file in NERDTree.
let g:nerdtree_tabs_autofind = 0
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
nnoremap <Leader>j :SplitjoinJoin<CR>
nnoremap <Leader>s :SplitjoinSplit<CR>
" }}}

" Vim Test"{{{
let test#strategy = "neovim"
let g:test#preserve_screen = 1
let g:test#runner_commands = ['Mocha']
let test#javascript#mocha#executable = 'npm run test'
let test#javascript#mocha#file_pattern = '_spec\.js'

" Run the whole test file
nmap <silent> <leader>T :TestFile<CR>
" Run the Test Suite
nmap <silent> <leader>a :TestSuite<CR>

" nmap <silent> <leader>t :TestNearest<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>"}}}

" Utilsnips {{{
" Trigger configuration.
let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'
" }}}

"Vim Airline {{{

let g:airline#extensions#syntastic#enabled        = 0         " Disable syntastic integration
let g:airline#extensions#tabline#enabled          = 1         " Enable Tab line
let g:airline#extensions#tabline#fnamemod         = ':t'      " Show just the filename in tabline
let g:airline#extensions#tabline#show_buffers     = 0         " Do not show buffer in tab bar
let g:airline#extensions#tabline#tab_nr_type      = 1         " Show splits and tab number in tab mode.
let g:airline#extensions#tmuxline#enabled         = 1         " Enable tmuxline integration >
let g:airline#extensions#wordcount#enabled        = 0         " Disbale words counter by default
let g:airline_powerline_fonts                     = 1         " Enable using powerline font
" let g:airline_section_c                           = 0         " Diable section_c (already show tabline)
let g:airline_theme                               = 'onedark' " Set airline theme
" let g:airline_section_warning                     = 0         " Disable warning section

" Integration with vim-obsession
let g:airline#extensions#obsession#enabled        = 1
let g:airline#extensions#obsession#indicator_text = '@'
" Integrate with ALE
" let g:airline_section_error = '%{ALEGetStatusLine()}'
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

" Setup used libraries
let g:used_javascript_libs = 'react, jquery, chai, underscore, lo-dash'

" Enables syntax highlighting for JSDocs.
let g:javascript_plugin_jsdoc = 1

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

" Concealing characters
" let g:javascript_conceal_function       = 'ƒ'
" let g:javascript_conceal_null           = 'ø'
" let g:javascript_conceal_this           = '@'
" let g:javascript_conceal_return         = '⇚'
" let g:javascript_conceal_undefined      = '¿'
" let g:javascript_conceal_NaN            = 'ℕ'
" let g:javascript_conceal_prototype      = '¶'
" let g:javascript_conceal_static         = '•'
" let g:javascript_conceal_super          = 'Ω'
" let g:javascript_conceal_arrow_function = '⇒'
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
let g:marked_app = 'Marked'
" }}}

" Vim Mocha {{{
let g:mocha_js_command = "!mocha --recursive {spec}"
nnoremap <Leader>ma :call RunAllSpecs()<CR>
" }}}

" Vim Table Mode {{{
let g:table_mode_corner='|'
" }}}

" Vim Peekaboo {{{
let g:peekaboo_window = 'vertical botright 60new' " Default peekaboo window
let g:peekaboo_compact = 0                        " Compact display; do not display the names of the register groups
" let g:peekaboo_delay = 0                          " Delay opening of peekaboo window (in ms. default: 0)
" let g:peekaboo_prefix = '<leader>'                " Prefix for the peekaboo key mapping (default: '')
" let g:peekaboo_ins_prefix = '<c-x>'               " Prefix for CTRL-R insert key mapping (default: '')
" }}}

" Vim Move {{{
let g:move_map_keys = 0
nnoremap <S-k> <Plug>MoveLineUp
nnoremap <S-j> <Plug>MoveLineDown
vnoremap <S-k> <Plug>MoveBlockUp
vnoremap <S-j> <Plug>MoveBlockDown
" }}}

" vim:foldmethod=marker:foldlevel=0