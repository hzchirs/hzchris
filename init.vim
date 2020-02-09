" ============================================================================
" Plugs
" ============================================================================
" builtin plugins
packadd matchit

if has('nvim')
  call plug#begin('~/.config/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

" ----------------------------------------------------------------------------
" Edit
" ----------------------------------------------------------------------------
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Konfekt/FastFold'
Plug 'chrisbra/Colorizer'
Plug 'chrisbra/NrrwRgn'
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-titlecase'
Plug 'gcmt/wildfire.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mg979/vim-visual-multi', {'branch': 'test'}
Plug 'mattn/emmet-vim', { 'for': ['html', 'eruby', 'vue'] }
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/SyntaxRange'
Plug 'vim-scripts/utl.vim'
Plug 'wellle/targets.vim'
" Plug 'wellle/context.vim' " 太慢，暫時解除

" 讓 vim 的 command line mode 支援 command line 快捷鍵
Plug 'ryvnf/readline.vim'

" ----------------------------------------------------------------------------
" Motion
" ----------------------------------------------------------------------------
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-slash'
Plug 'airblade/vim-matchquote'

" ----------------------------------------------------------------------------
" Text Object
" ----------------------------------------------------------------------------
Plug 'haya14busa/vim-textobj-function-syntax'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-user'
Plug 'rhysd/vim-textobj-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-surround'

" ----------------------------------------------------------------------------
" linter
" ----------------------------------------------------------------------------
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)


" ----------------------------------------------------------------------------
" Languages
" ----------------------------------------------------------------------------
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'gavocanov/vim-js-indent'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': ['vue' ,'javascript', 'javascript.jsx'] }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for': 'python' }
Plug 'plytophogy/vim-virtualenv', { 'for': 'python' }
Plug 'PieterjanMontens/vim-pipenv', { 'for': 'python' }

let g:vue_disable_pre_processors = 1
let g:javascript_plugin_jsdoc = 1

" ----------------------------------------------------------------------------
" Development Tools
" ----------------------------------------------------------------------------
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-db', { 'on': 'DB' }
Plug 'tpope/vim-unimpaired'
Plug 'janko/vim-test'

" ----------------------------------------------------------------------------
" Browsing
" ----------------------------------------------------------------------------
Plug 'Yggdroot/indentLine'
Plug 'liuchengxu/vista.vim'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" ----------------------------------------------------------------------------
" Diff
" ----------------------------------------------------------------------------
Plug 'AndrewRadev/linediff.vim' 

" ----------------------------------------------------------------------------
" Git
" ----------------------------------------------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" ----------------------------------------------------------------------------
" Fuzzy finder
" ----------------------------------------------------------------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" ----------------------------------------------------------------------------
" Themes
" ----------------------------------------------------------------------------
Plug 'NLKNguyen/papercolor-theme'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
Plug 'dracula/vim'
Plug 'hzchirs/vim-material', { 'dir': '~/Projects/vim-material' }
" Plug 'hzchirs/nature', { 'dir': '~/Projects/sunshine' }
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ----------------------------------------------------------------------------
" Supports
" ----------------------------------------------------------------------------
Plug 'editorconfig/editorconfig-vim'
Plug 'rizzatti/dash.vim'
" Plug 'soywod/vim-keepeye'

" ----------------------------------------------------------------------------
" Completion/Snippets
" ----------------------------------------------------------------------------
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'kkoomen/vim-doge'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" ----------------------------------------------------------------------------
" Others
" ----------------------------------------------------------------------------
Plug 'itchyny/calendar.vim'
Plug 'vim-scripts/BufOnly.vim'

" ----------------------------------------------------------------------------
" Note
" ----------------------------------------------------------------------------
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }


call plug#end()

" ============================================================================
" Basic settings
" ============================================================================
let mapleader=" "

set list lcs=tab:\|\ " tab indent guide
set fileencodings=utf-8,cp950
set nocompatible              " be iMproved, required
set hidden
" set showcmd
filetype plugin indent on                  " required
set relativenumber

set autoindent
" set foldmethod=syntax
set foldmethod=indent
set foldlevel=20
set clipboard+=unnamed
set shell=zsh

" ctags
set tags=./tags;/

" mouse scroll smooth
set cursorline!
set lazyredraw
set synmaxcol=256
syntax sync minlines=256

" coc recommend settings
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
" set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" 視覺斷行，不會插入 EOL
" set wrap
" 讓視覺斷行斷在文字結束的地方而非中間
" set linebreak
" 斷行會自動縮排
" set breakindent
" 視覺斷行前顯示記號
" let &showbreak = '↳ '
set nowrap

set cpoptions+=n

" paste without replace
xnoremap p pgvy

" 編輯喜好設定
set ai           " 自動縮排
set shiftwidth=2 " 設定縮排寬度 = 2
set tabstop=2    " tab 的字元數
" set softtabstop=2

set expandtab   " 用 space 代替 tab
set nu          " Show line number

set cc=120       " 在第120的寬度顯示提示線
set ruler        " 顯示右下角設定值
set backspace=2  " 在 insert 也可用 backspace
set ic           " 設定搜尋忽略大小寫
set hlsearch     " 設定高亮度顯示搜尋結果
set incsearch    " 在關鍵字還沒完全輸入完畢前就顯示結果
set smartindent  " 設定 smartindent
set confirm      " 操作過程有衝突時，以明確的文字來詢問
set history=100  " 保留 100 個使用過的指令
set cursorline   " 顯示目前的游標位置
set formatoptions+=mM


" 让水平滚动更加自然
set sidescroll=1
set sidescrolloff=3

" 游標置中
set scrolloff=999

" 讓滑鼠在所有模式下均可正常使用
set mouse=a

if has('nvim')
  set termguicolors
  set inccommand=nosplit
endif

set linespace=5

let g:rubycomplete_buffer_loading = 1

set laststatus=2

set background=dark
" let g:material_style='palenight'
color vim-material
" color dracula
let g:airline_theme="material"
" let g:airline_theme="nature"

highlight ALEErrorSign guifg=red
highlight ALEWarningSign guifg=orange

function! RemoveTrailingSpace()
  %s/\s\+$//e
endfunction
nnoremap <leader><leader>rt :call RemoveTrailingSpace()<CR>

" 檢查文字 highlight
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

nnoremap <leader><leader>x :call SyntaxItem()<CR>

" ============================================================================
" Autocmds
" ============================================================================
" ----------------------------------------------------------------------------
" vue 相關設定
" ----------------------------------------------------------------------------
" autocmd FileType vue syntax sync fromstart

" ----------------------------------------------------------------------------
" python 相關設定
" ----------------------------------------------------------------------------
augroup filetype_python
  au!
  autocmd FileType python set foldmethod=indent
augroup END

" ----------------------------------------------------------------------------
" 進入 markdown 文件時的相關設定
" ----------------------------------------------------------------------------
" ----------------------------------------------------------------------------
" GV 寬度設定
" ----------------------------------------------------------------------------
autocmd FileType git vertical resize 120
" ----------------------------------------------------------------------------
" Normal mode
" ----------------------------------------------------------------------------
" go run python3 for current file
nnoremap <silent><leader>rp :!python3 %<CR>
" go run ruby for current file
nnoremap <silent><leader>rr :!ruby %<CR>
" go run javascript for current file
nnoremap <silent><leader>rj :!node %<CR>

nnoremap <leader>rspd :!puma-dev -stop<CR>

" 以螢幕所見的行而非實際的行來移動
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" 水平 scroll
nnoremap <S-L> 10zl
nnoremap <S-H> 10zh

nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" 縮放視窗
nnoremap <silent><leader>= :exe "vertical resize " . (winwidth(0) * 10/9)<CR>
nnoremap <silent><leader>- :exe "vertical resize " . (winwidth(0) * 9/10)<CR>

" buffer 移動
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <S-X> :bp\|bd #<CR>

" ----------------------------------------------------------------------------
" Insert Mode
" ----------------------------------------------------------------------------
inoremap jk <esc>

" 模擬 Emacs 操作
inoremap <C-e> <esc>A
inoremap <C-a> <esc>I
inoremap <C-f> <right>
inoremap <C-b> <left>
inoremap <C-n> <down>
inoremap <C-p> <up>

" ----------------------------------------------------------------------------
" Operator Mapping
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" Visual Mode
" ----------------------------------------------------------------------------
" Search visualed context
vnoremap // y/<C-R>"<CR>

" 以螢幕所見的行而非實際的行來移動
vnoremap k gkzz
vnoremap gk kzz
vnoremap j gjzz
vnoremap gj jzz
" ----------------------------------------------------------------------------
" Terminal Emulator
" ----------------------------------------------------------------------------
augroup term_emulator
  au!
  au TermOpen * setlocal nonumber norelativenumber
augroup END

nnoremap <leader>rc :belowright split \| terminal bundle exec rails console<CR> \| i
nnoremap <leader>vt :vsplit \| terminal<CR> \| i
nnoremap <leader>st :belowright split \| terminal<CR> \| i
nnoremap <leader>cl :call RunCurrentSpecLine()<CR>
nnoremap <leader>cs :call RunCurrentSpecFile()<CR>

function! RunCurrentSpecLine()
  let lineNum = line('.')

  exec 'belowright split'
  exec 'terminal bundle exec rspec %:' . lineNum
  startinsert!
endfunction

function! RunCurrentSpecFile()
  exec 'belowright split'
  exec 'terminal bundle exec rspec %'
  startinsert!
endfunction

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

if has('nvim')
  tnoremap jk <C-\><C-N>
endif

" 不同模式的儲存
nnoremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR><Right>

" ============================================================================
" Language Settings
" ============================================================================
" ----------------------------------------------------------------------------
" Go
" ----------------------------------------------------------------------------
augroup filetype_go
  au!
  autocmd FileType go setlocal tabstop=8
  autocmd FileType go setlocal shiftwidth=8
augroup END

" ----------------------------------------------------------------------------
" HTML, ERB
" ----------------------------------------------------------------------------
augroup filetype_html
  au!
  autocmd FileType eruby nnoremap <buffer> zc zfat
  autocmd FileType html nnoremap <buffer> zc zfat
augroup END

" ============================================================================
" Plugs Settings
" ============================================================================

" ----------------------------------------------------------------------------
" FZF
" ----------------------------------------------------------------------------
" if has('nvim') || has('gui_running')
"   let $FZF_DEFAULT_OPTS .= ' --inline-info'
"   let $FZF_DEFAULT_COMMAND= 'ag -g ""'
" endif

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <S-p> :Buffers<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
nnoremap <leader>fi :AgIn 

nnoremap <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
nnoremap <silent> <leader>fc :Commits<CR>
nnoremap <silent> <leader>fbc :BCommits<CR>
nnoremap <silent> <leader>fl :Lines<CR>
nnoremap <silent> <leader>fbl :BLines<CR>

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
  call fzf#vim#ag(join(a:000[1:], ' '), fzf#vim#with_preview(extend({'dir': a:1}, {'down': '~40%', 'options': '--delimiter : --nth 4..'})))
endfunction

command! -nargs=+ -complete=dir AgIn call s:ag_in(<f-args>)

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" Files command with preview window
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir Buffers
      \ call fzf#vim#buffers(<q-args>, fzf#vim#with_preview(), <bang>0)

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
  set linebreak

  Limelight
endfunction

function! s:goyo_leave()
  set nowrap

  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" ----------------------------------------------------------------------------
" ultisnips
" ----------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"

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
augroup filetype_vimwiki
  au!
  au FileType vimwiki normal zM
  au FileType vimwiki let &l:showbreak = ""
  au FileType vimwiki nnoremap <buffer> <leader><leader>n :lnext<CR>
  au FileType vimwiki nnoremap <buffer> <leader><leader>p :lprevious<CR>
  au FileType vimwiki nnoremap <buffer> <leader><leader>g :Goyo<CR>
  au FileType vimwiki nmap <buffer> <leader>tt <Plug>VimwikiToggleListItem
  au FileType vimwiki nnoremap <buffer> //s :VWS<space>
  au FileType vimwiki nnoremap <buffer> //t :VimwikiSearchTags<space>
  " au FileType vimwiki setlocal background=light
  " au FileType vimwiki colorscheme nature
  " au FileType vimwiki :AirlineTheme nature
  " 避免中文不正常斷行
  " au FileType vimwiki setlocal breakat=^I!@+;:,./?
augroup END


" let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/',
"       \ 'path_html': '~/Dropbox/vimwiki_html/',
"       \ 'syntax': 'markdown', 'ext': '.md',
"       \ 'auto_diary_index': 1,
"       \ 'auto_tags': 1}]
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/',
      \ 'path_html': '~/Dropbox/vimwiki_html/',
      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_CJK_length = 1
let g:vimwiki_folding = 'expr:quick'
let g:vimwiki_use_calendar = 1

" ----------------------------------------------------------------------------
" utl.vim
" ----------------------------------------------------------------------------
let g:utl_cfg_hdl_scm_http_system = "silent !open -a firefox '%u'"

" ----------------------------------------------------------------------------
" vim-jsx
" ----------------------------------------------------------------------------
" let g:jsx_ext_required = 0

" ----------------------------------------------------------------------------
" vim-ruby
" ----------------------------------------------------------------------------
let g:ruby_indent_access_modifier_style = 'indent'
let g:ruby_indent_assignment_style = 'variable'
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
" vista
" ----------------------------------------------------------------------------
let g:vista_echo_cursor_strategy = 'floating_win'
nmap <silent> <leader>vo :Vista coc<CR>
nmap <silent> <leader>vc :Vista!<CR>

" ----------------------------------------------------------------------------
" indentLine
" ----------------------------------------------------------------------------
let g:indentLine_setColors = 0
let g:indentLine_fileType = ['ruby', 'javascript', 'html', 'eruby', 'vue']
nnoremap <silent><leader>ig :IndentLinesToggle<CR>

" ----------------------------------------------------------------------------
" vim-rails
" ----------------------------------------------------------------------------
let g:rails_ctags_arguments = ['--languages=ruby --exclude=.git --exclude=log .']
" let g:rails_ctags_arguments = ['--languages=Ruby --exclude=.git --exclude=log . $(bundle list --paths)']

" ----------------------------------------------------------------------------
" vim-go
" ----------------------------------------------------------------------------
nnoremap <leader>gr :GoRun<CR>

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
nnoremap <silent><leader>dd :Dash<CR>

" ----------------------------------------------------------------------------
" COC
" ---------------------------------------------------------------------------- COC
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" ----------------------------------------------------------------------------
" BufOnly
" ----------------------------------------------------------------------------
nnoremap <leader>bo :BufOnly<CR>

" ----------------------------------------------------------------------------
" vim-doge
" ----------------------------------------------------------------------------
nnoremap <leader>dg :DogeGenerate<CR>

" ----------------------------------------------------------------------------
" EasyMotion
" ----------------------------------------------------------------------------
let g:EasyMotion_smartcase = 1

" <Leader>f{char} to move to {char}
map  <Leader><leader>f <Plug>(easymotion-bd-f)
nmap <Leader><leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" ----------------------------------------------------------------------------
" Calendar
" ----------------------------------------------------------------------------
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" ----------------------------------------------------------------------------
" quick-scope
" ----------------------------------------------------------------------------"""
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
