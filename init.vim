" ============================================================================
" Plugs
" ============================================================================
if has('nvim')
  call plug#begin('~/.config/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

if has('gui_running')
  set guifont=DroidSansMonoForPowerline\ Nerd\ Font:h16
  " set runtimepath^=~/.vim/bundle/ctrlp.vim
  " let g:ctrlp_map = '<c-p>'
  " let g:ctrlp_cmd = 'CtrlP'
endif

" ----------------------------------------------------------------------------
" Edit
" ----------------------------------------------------------------------------
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Konfekt/FastFold'
Plug 'bkad/CamelCaseMotion'
Plug 'chrisbra/Colorizer'
Plug 'chrisbra/csv.vim'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-titlecase'
Plug 'haya14busa/vim-textobj-function-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-user'
Plug 'mattn/emmet-vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'terryma/vim-multiple-cursors'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/ReplaceWithRegister'

" ----------------------------------------------------------------------------
" Linter
" ----------------------------------------------------------------------------
" Asynchronous Lint Engine
" 只在 save 時才 link
" 因為隨時 lint 非常耗電
" Plug 'w0rp/ale'
" nmap <silent> <S-p> <Plug>(ale_previous_wrap)
" nmap <silent> <S-n> <Plug>(ale_next_wrap)
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0

" ----------------------------------------------------------------------------
" Languages
" ----------------------------------------------------------------------------
Plug 'fatih/vim-go'
Plug 'gavocanov/vim-js-indent'
Plug 'jparise/vim-graphql'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'posva/vim-vue'
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

" ----------------------------------------------------------------------------
" Browsing
" ----------------------------------------------------------------------------
Plug 'Yggdroot/indentLine'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" ----------------------------------------------------------------------------
" Git
" ----------------------------------------------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" ----------------------------------------------------------------------------
" Motion
" ----------------------------------------------------------------------------
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-slash'

" ----------------------------------------------------------------------------
" Fuzzy finder
" ----------------------------------------------------------------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" ----------------------------------------------------------------------------
" Themes
" ----------------------------------------------------------------------------
Plug 'chriskempson/base16-vim'
Plug 'dikiaap/minimalist'
Plug 'dracula/vim'
Plug 'hzchirs/Spacegray.vim'
Plug 'hzchirs/vim-material'
Plug 'nightsense/nemo'
Plug 'rakr/vim-one'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'

" ----------------------------------------------------------------------------
" Supports
" ----------------------------------------------------------------------------
Plug 'editorconfig/editorconfig-vim'
Plug 'rizzatti/dash.vim'

" ----------------------------------------------------------------------------
" Completion/Snippets
" ----------------------------------------------------------------------------
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

if has('nvim')
  " Use deoplete.
  function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
  let g:deoplete#enable_at_startup = 1
  " deoplete tab-complete
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
  let g:deoplete#max_list = 6
  inoremap <silent> <CR> <C-r>=<SID>return_without_deoplete()<CR>
  function! s:return_without_deoplete() abort
    return deoplete#mappings#close_popup() . "\<CR>"
  endfunction
endif

" ----------------------------------------------------------------------------
" Note
" ----------------------------------------------------------------------------
Plug 'vimwiki/vimwiki'

call plug#end()

" ============================================================================
" Basic settings
" ============================================================================
set encoding=utf-8
set fileencodings=utf-8,cp950
set nocompatible              " be iMproved, required
set hidden
" set showcmd
filetype plugin indent on                  " required
set relativenumber
set autoindent
set foldmethod=syntax
set foldlevel=20
set wrap linebreak nolist
set clipboard+=unnamed
set shell=zsh

" mouse scroll smooth
set cursorline!
set lazyredraw
set synmaxcol=256
syntax sync minlines=256

" 行過長時不斷行（可超過螢幕寬度）
set nowrap
" paste without replace
xnoremap p pgvy


" 編輯喜好設定                                                                                                                                                                                                     
syntax enable        " 語法上色顯示
" set ai           " 自動縮排
set shiftwidth=2 " 設定縮排寬度 = 4 
set tabstop=2    " tab 的字元數
set softtabstop=2

set expandtab   " 用 space 代替 tab
set nu          " Show line number

set cc=120       " 在第120的寬度顯示提示線 
set ruler        " 顯示右下角設定值
set backspace=2  " 在 insert 也可用 backspace
set ic           " 設定搜尋忽略大小寫
set ru           " 第幾行第幾個字
set hlsearch     " 設定高亮度顯示搜尋結果
set incsearch    " 在關鍵字還沒完全輸入完畢前就顯示結果
set smartindent  " 設定 smartindent
set confirm      " 操作過程有衝突時，以明確的文字來詢問
set history=100  " 保留 100 個使用過的指令
set cursorline   " 顯示目前的游標位置

" 让水平滚动更加自然
set sidescroll=1
set sidescrolloff=3

let g:terminal_color_0  = '#2e3436'
let g:terminal_color_1  = '#ff5555'
let g:terminal_color_2  = '#50fa7b'
let g:terminal_color_3  = '#f1fa8c'
let g:terminal_color_4  = '#bd93f9'
let g:terminal_color_5  = '#ff79c6'
let g:terminal_color_6  = '#8be9fd'
let g:terminal_color_7  = '#d3d7cf'
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#ef2929'
let g:terminal_color_10 = '#8ae234'
let g:terminal_color_11 = '#f1fa8c'
let g:terminal_color_12 = '#bd93f9'
let g:terminal_color_13 = '#ad7fa8'
let g:terminal_color_14 = '#8be9fd'
let g:terminal_color_15 = '#f8f8f2'

" 开启 NVIM 专用选项
if has('nvim')
  " 允许真彩显示
  set termguicolors 
endif

set linespace=5

if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif"

let g:rubycomplete_buffer_loading = 1


set laststatus=2
set background=dark
color vim-material
let g:airline_theme="material"
highlight Search guibg=NONE guifg=NONE gui=underline
highlight ALEErrorSign guibg=red
highlight ALEWarningSign guibg=orange 

function! SyntaxItem()
  echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
endfunction

function! SynStack()
    if !exists('*synstack')
        return
    endif
    echo map(synstack(line('.'), col('.')), "synIDattr(v:val, 'name')")
endfunc
" nmap <leader><leader>x :call SynStack()<CR>
nmap <leader><leader>x :call SyntaxItem()<CR>

" ============================================================================
" Mappings
" ============================================================================
" go run python3 for current file
nnoremap <silent><leader>rp :!python3 %<CR>
" go run ruby for current file
nnoremap <silent><leader>rr :!ruby %<CR>
" restart powder
nnoremap <leader>rspd :!powder restart<CR>

map <space> <leader>
map <space><space> <leader><leader>

" 以螢幕所見的行而非實際的行來移動
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

inoremap jk <esc>
inoremap <C-d> <esc>ddi
inoremap <C-u> <esc>g~iwi

inoremap <C-e> <esc>A
inoremap <C-a> <esc>I

onoremap in( :<C-u>normal! f(vi(<cr>
onoremap il( :<C-u>normal! F)vi(<cr>

" 縮放視窗
nnoremap <silent><leader>= :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent><leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" buffer 移動
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <S-X> :bp\|bd #<CR>
nnoremap <S-W> :bd<CR>
" tnoremap <S-W> :bd!<CR>

" Terminal Emulator
nnoremap <leader>vt :vsplit \| terminal<CR>
nnoremap <leader>st :split \| terminal<CR>

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

if has('nvim')
  " tnoremap jk <C-\><C-N>
  " tnoremap <C-j> <C-\><C-N><C-w>j
  " tnoremap <C-k> <C-\><C-N><C-w>k
endif

" 儲存
nnoremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR><Right>

" ============================================================================
" Plugs Settings
" ============================================================================

" ----------------------------------------------------------------------------
" CamelCaseMotion
" ----------------------------------------------------------------------------
call camelcasemotion#CreateMotionMappings('<leader>i')
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

" ----------------------------------------------------------------------------
" FZF
" ----------------------------------------------------------------------------
let g:fzf_tags_command = 'ctags -R'
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>w :Windows<CR>
nnoremap <silent> <leader>l :BLines<CR>
nnoremap <silent> <leader>t :BTags<CR>
nnoremap <silent> <leader>T :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
nnoremap <leader>f :AgIn 

nnoremap <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
nnoremap <silent> <leader>cc :Commits<CR>
nnoremap <silent> <leader>bc :BCommits<CR>
nnoremap <silent> <leader>ft :Filetypes<CR>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <C-x><C-j> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

function! SearchWordWithAg()
  execute 'Ag' expand('<cword>')
endfunction

function! SearchVisualSelectionWithAg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'Ag' selection
endfunction

function! s:ag_in(...)
  call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, {'down': '~40%'}))
endfunction

command! -nargs=+ -complete=dir AgIn call s:ag_in(<f-args>)

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Type'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Identifier'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" ----------------------------------------------------------------------------
" Goyo
" ----------------------------------------------------------------------------
let g:goyo_width = 80

function! s:goyo_enter()
  set wrap
endfunction

function! s:goyo_leave()
  set nowrap
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" ----------------------------------------------------------------------------
" ultisnips
" ----------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<c-b>"

" ----------------------------------------------------------------------------
" vim-airline
" ----------------------------------------------------------------------------
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" ----------------------------------------------------------------------------
" Git Related
" ----------------------------------------------------------------------------
nnoremap <silent><leader>gs :Gstatus<CR>
nnoremap <silent><leader>gc :Gcommit<CR>
nnoremap <silent><leader>git :Git

" ----------------------------------------------------------------------------
" vimwiki
" ----------------------------------------------------------------------------
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'path_html': '~/Dropbox/vimwiki_html/'}]
let g:vimwiki_CJK_length = 1

" ----------------------------------------------------------------------------
" vim-jsx
" ----------------------------------------------------------------------------
let g:jsx_ext_required = 0

" ----------------------------------------------------------------------------
" vim-ruby
" ----------------------------------------------------------------------------
let g:ruby_indent_access_modifier_style = 'indent'
let ruby_operators = 1
let ruby_fold = 1

" ----------------------------------------------------------------------------
" vim-devicons
" ----------------------------------------------------------------------------
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" ----------------------------------------------------------------------------
" nerdtree
" ----------------------------------------------------------------------------
nnoremap <silent><C-\> :NERDTreeToggle<CR>

" ----------------------------------------------------------------------------
" tagbar
" ----------------------------------------------------------------------------
nmap <F8> :TagbarToggle<CR>

" ----------------------------------------------------------------------------
" indentLine
" ----------------------------------------------------------------------------
let g:indentLine_setColors = 0
let g:indentLine_enabled = 0
nnoremap <silent><leader>ig :IndentLinesToggle<CR>

" ----------------------------------------------------------------------------
" vim-rails
" ----------------------------------------------------------------------------
let g:rails_ctags_arguments = ['--languages=ruby --exclude=.git --exclude=log .']

" ----------------------------------------------------------------------------
" vim-rspec
" ----------------------------------------------------------------------------
let g:rspec_command = "!bundle exec rspec {spec}"
let g:rspec_runner = "os_x_iterm2"
map <Leader><Leader>t :call RunCurrentSpecFile()<CR>

" ----------------------------------------------------------------------------
" vim-go
" ----------------------------------------------------------------------------
nnoremap <leader>gr :GoRun<CR>

" ----------------------------------------------------------------------------
" vim-markdown
" ----------------------------------------------------------------------------
let g:vim_markdown_toc_autofit      = 1
let g:vim_markdown_frontmatter      = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_folding_disabled = 1

" ----------------------------------------------------------------------------
" csv.vim
" ----------------------------------------------------------------------------
let g:csv_autocmd_arrange = 1

" ----------------------------------------------------------------------------
" vim-easy-align
" ----------------------------------------------------------------------------
nmap ga <Plug>(EasyAlign)

" ----------------------------------------------------------------------------
" dash
" ----------------------------------------------------------------------------
nnoremap <silent><leader>d :Dash<CR>

" ----------------------------------------------------------------------------
" vim-multiple-cursors
" ----------------------------------------------------------------------------
"  解決 multiple cursor  出現異常字元的問題
function! Multiple_cursors_before()
    if exists('g:deoplete#disable_auto_complete') 
	   let g:deoplete#disable_auto_complete = 1
    endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
    if exists('g:deoplete#disable_auto_complete')
	   let g:deoplete#disable_auto_complete = 0
    endif
endfunction
