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
" Navigation
" ----------------------------------------------------------------------------
Plug 'unblevable/quick-scope'
Plug 'phaazon/hop.nvim'
Plug 'airblade/vim-matchquote'

" ----------------------------------------------------------------------------
" Edit
" ----------------------------------------------------------------------------
Plug 'AndrewRadev/splitjoin.vim'
Plug 'chrisbra/Colorizer'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-titlecase'
Plug 'gcmt/wildfire.vim'
Plug 'junegunn/vim-easy-align'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mattn/emmet-vim', { 'for': ['html', 'eruby', 'vue'] }
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/SyntaxRange'
Plug 'vim-scripts/utl.vim'
Plug 'wellle/targets.vim'
Plug 'matze/vim-move'

" 讓 vim 的 command line mode 支援 command line 快捷鍵
Plug 'ryvnf/readline.vim'
" ----------------------------------------------------------------------------
" Text Object
" ----------------------------------------------------------------------------
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'haya14busa/vim-textobj-function-syntax'
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'tpope/vim-surround'

" ----------------------------------------------------------------------------
" Development Tools
" ----------------------------------------------------------------------------
" Plug 'tpope/vim-unimpaired'
Plug 'windwp/nvim-autopairs'
Plug 'janko/vim-test'
Plug 'akinsho/toggleterm.nvim', { 'tag': '*' }
Plug 'nvim-lua/plenary.nvim'
  

" ----------------------------------------------------------------------------
" Browsing
" ----------------------------------------------------------------------------
Plug 'goolord/alpha-nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'
Plug 'RRethy/nvim-treesitter-endwise'

" ----------------------------------------------------------------------------
" Git
" ----------------------------------------------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" ----------------------------------------------------------------------------
" Fuzzy finder
" ----------------------------------------------------------------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" ----------------------------------------------------------------------------
" Themes
" ----------------------------------------------------------------------------
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Plug 'shaunsingh/nord.nvim'
" Plug 'dracula/vim'
Plug 'hzchirs/vim-material', { 'dir': '~/Projects/vim-material' }

" Plug 'kaicataldo/material.vim', { 'branch': 'main' }
" Plug 'sainnhe/everforest'
Plug 'nvim-lualine/lualine.nvim'
Plug 'romgrk/barbar.nvim'

" ----------------------------------------------------------------------------
" Supports
" ----------------------------------------------------------------------------
Plug 'editorconfig/editorconfig-vim'
Plug 'rizzatti/dash.vim'


" ----------------------------------------------------------------------------
" Completion/Snippets
" ----------------------------------------------------------------------------
" Plug 'SirVer/ultisnips'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.*'}
  Plug 'rafamadriz/friendly-snippets'

Plug 'danymat/neogen', { 'on': 'Neogen' }
Plug 'stevearc/aerial.nvim' " Outline
Plug 'github/copilot.vim'


" ----------------------------------------------------------------------------
" Others
" ----------------------------------------------------------------------------
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'

Plug 'itchyny/calendar.vim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'szw/vim-maximizer'

" ----------------------------------------------------------------------------
" Note
" ----------------------------------------------------------------------------
" Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
" Plug 'mickael-menu/zk-nvim'

" ----------------------------------------------------------------------------
" Languages
" ----------------------------------------------------------------------------
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'chr4/nginx.vim'

call plug#end()

" ============================================================================
" Basic settings
" ============================================================================
let mapleader=" "

set nocompatible              " be iMproved, required
set undofile " Maintain undo history between sessions
" set showcmd
" set regexpengine=1
set relativenumber
" filetype plugin indent on                  " required

" set autoindent
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=20
set clipboard+=unnamed
set shell=zsh
set completeopt=menu,menuone,noselect

" ctags
set tags=./tags;/

" mouse scroll smooth
set cursorline!
set lazyredraw
" set synmaxcol=256
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
" set ai           " 自動縮排
set shiftwidth=2 " 設定縮排寬度 = 2
set smartindent  " 不要設定 smartindent! 會造成縮排錯誤
set softtabstop=2

set expandtab   " 用 space 代替 tab
set nu          " Show line number

set cc=120       " 在第120的寬度顯示提示線
set ruler        " 顯示右下角設定值
set backspace=2  " 在 insert 也可用 backspace
set ic           " 設定搜尋忽略大小寫
set hlsearch     " 設定高亮度顯示搜尋結果
set incsearch    " 在關鍵字還沒完全輸入完畢前就顯示結果
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
let g:python3_host_prog = '/opt/homebrew/bin/python3'

set laststatus=2

set background=dark
color vim-material

lua <<EOF
require('lualine').setup({
  options = { theme = 'material' }
})
EOF

" " ============================================================================
" " Autocmds
" " ============================================================================
" " ----------------------------------------------------------------------------
" " GV 寬度設定
" " ----------------------------------------------------------------------------
" autocmd FileType git vertical resize 120
" " ----------------------------------------------------------------------------
" " Normal mode
" " ----------------------------------------------------------------------------
" go run python3 for current file
nnoremap <silent><leader>rp :!python3 %<CR>
" go run ruby for current file
nnoremap <silent><leader>rr :!ruby %<CR>
" go run javascript for current file
nnoremap <silent><leader>rj :!node %<CR>

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
nnoremap <silent><S-X> <Cmd>BufferClose<CR>

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

" 移動游標隨時置中
" vnoremap k gkzz
" vnoremap gk kzz
" vnoremap j gjzz
" vnoremap gj jzz
" ----------------------------------------------------------------------------
" Terminal Emulator
" ----------------------------------------------------------------------------
augroup term_emulator
  au!
  au TermOpen * setlocal nonumber norelativenumber
augroup END
nnoremap <leader>rc :belowright split \| terminal bundle exec rails console<CR> \| i
nnoremap <leader>cl :call RunCurrentSpecLine()<CR>
nnoremap <leader>cs :call RunCurrentSpecFile()<CR>

" tnoremap <C-j> <C-\><C-N><C-W>j
" tnoremap <C-k> <C-\><C-N><C-W>k
" tnoremap <C-l> <C-\><C-N><C-W>l
" tnoremap <C-h> <C-\><C-N><C-W>h

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
  tnoremap `` <C-\><C-N>
endif

" 不同模式的儲存
nnoremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR><Right>

" " ============================================================================
" " Language Settings
" " ============================================================================
" " ----------------------------------------------------------------------------
" " Go
" " ----------------------------------------------------------------------------
" augroup filetype_go
"   au!
"   autocmd FileType go setlocal tabstop=8
"   autocmd FileType go setlocal shiftwidth=8
" augroup END
"
" " ----------------------------------------------------------------------------
" " Python
" " ----------------------------------------------------------------------------
" let g:python_highlight_all = 1
" ============================================================================
" Plugs Settings
" ============================================================================

" ----------------------------------------------------------------------------
" Telescope 
" ----------------------------------------------------------------------------
lua <<EOF

-- function vim.getVisualSelection()
--   vim.cmd('noau normal! "vy"')
--   local text = vim.fn.getreg('v')
--   vim.fn.setreg('v', {})
--
--   text = string.gsub(text, "\n", "")
--   if #text > 0 then
--     return text
--   else
--     return ''
--   end
-- end
--
-- local actions = require('telescope.actions')
-- local builtin = require('telescope.builtin')
-- require('telescope').setup({
--   pickers = {
--     live_grep = {
--       mappings = {
--         i = { ["<c-f>"] = actions.to_fuzzy_refine },
--       }
--     }
--   },
--   defaults = {
--     layout_strategy = 'horizontal',
--     layout_config = {
--       vertical = { width = 0.8 },
--       horizontal = { height = 0.9, width = 0.9 }
--     },
--     file_ignore_patterns = { 
--       "public/",
--       "vendor/",
--       "data_set",
--       "node_modules/",
--       "spec/fixtures/db/",
--       ".git/",
--     },
--     mappings = {
--       i = {
--         ["<C-j>"] = actions.move_selection_next,
--         ["<C-k>"] = actions.move_selection_previous,
--         ["<C-n>"] = actions.cycle_history_next,
--         ["<C-p>"] = actions.cycle_history_prev,
--       }
--     }
--    }
-- })
--
-- vim.keymap.set(
--   'n', 
--   '<C-p>',
--   function() 
--     builtin.find_files({ 
--       hidden = true,
--     }) 
--   end, 
--   {}
-- )
-- vim.keymap.set('n', '<S-p>', builtin.buffers, {})
-- vim.keymap.set('n', 'K', builtin.grep_string, {})
-- -- vim.keymap.set('n', '<leader>gg', 
-- --   function()
-- --     builtin.grep_string({
-- --       only_sort_text = true, 
-- --       search = '',
-- --     })
-- --   end,
-- --   {}
-- -- )
-- vim.keymap.set('n', '<leader>hh', builtin.help_tags, {})
-- require('telescope').load_extension('fzf')
--
-- local keymap = vim.keymap.set
-- local tb = require('telescope.builtin')
-- local opts = { noremap = true, silent = true }
--
-- keymap('v', 'K', function()
-- 	local text = vim.getVisualSelection()
-- 	tb.live_grep({ default_text = text })
-- end, opts)
EOF

" ----------------------------------------------------------------------------
" FZF 
" ----------------------------------------------------------------------------
if has('nvim') || has('gui_running')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
  let $FZF_DEFAULT_COMMAND= 'ag -g ""'
endif

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <S-p> :Buffers<CR>
nnoremap <silent> <leader>fh :History<CR>

nnoremap <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
nnoremap <silent> <leader>hh :Helptags<CR>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <C-x><C-j> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

function! s:ag_in(bang, ...)
  if !isdirectory(a:1)
    throw 'not a valid directory: ' .. a:1
  endif
  " Press `?' to enable preview window.
  call fzf#vim#ag(join(a:000[1:], ' '), fzf#vim#with_preview({'dir': a:1}, 'up:50%:hidden', '?'), a:bang)
endfunction

command! -bang -nargs=+ -complete=dir AgIn call s:ag_in(<bang>0, <f-args>)

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

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" " ----------------------------------------------------------------------------
" " Goyo
" " ----------------------------------------------------------------------------
" let g:goyo_width = 120
"
" function! s:goyo_enter()
"   set wrap
"   set linebreak
"
"   " Limelight
" endfunction
"
" function! s:goyo_leave()
"   set nowrap
"
"   " Limelight!
" endfunction
"
" autocmd! User GoyoEnter nested call <SID>goyo_enter()
" autocmd! User GoyoLeave nested call <SID>goyo_leave()
"
" " ----------------------------------------------------------------------------
" " barbar.nvim
" " ----------------------------------------------------------------------------
nnoremap <silent><A-{> :BufferPrevious<CR>
nnoremap <silent><A-}> :BufferNext<CR>
nnoremap <silent><A-[> :BufferMovePrevious<CR>
nnoremap <silent><A-]> :BufferMoveNext<CR>

" " ----------------------------------------------------------------------------
" " vimwiki
" " ----------------------------------------------------------------------------
" " augroup filetype_vimwiki
" "   au!
" "   au FileType vimwiki let &l:showbreak = ""
" "   au FileType vimwiki nnoremap <buffer> <leader><leader>n :lnext<CR>
" "   au FileType vimwiki nnoremap <buffer> <leader><leader>p :lprevious<CR>
" "   au FileType vimwiki nnoremap <buffer> <leader><leader>g :Goyo<CR>
" "   au FileType vimwiki nnoremap <buffer> //s :VWS<space>
" "   au FileType vimwiki nnoremap <buffer> //t :VimwikiSearchTags<space>
" " augroup END
" "
" " let g:vimwiki_key_mappings = { 'table_mappings': 0 }
" " let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/',
" "       \ 'path_html': '~/Dropbox/vimwiki_html/',
" "       \ 'syntax': 'markdown', 'ext': '.md'}]
" " let g:vimwiki_CJK_length = 1
" " let g:vimwiki_folding = 'expr:quick'
" " let g:vimwiki_use_calendar = 1
"

" ----------------------------------------------------------------------------
" indentLine
" ----------------------------------------------------------------------------
let g:indentLine_setColors = 0
let g:indentLine_fileType = ['ruby', 'javascript', 'html', 'eruby', 'vue', 'lua', 'vim', 'elixir']
nnoremap <silent><leader>ig :IndentLinesToggle<CR>

" ----------------------------------------------------------------------------
" vim-rails
" ----------------------------------------------------------------------------
let g:rails_ctags_arguments = ['--languages=ruby --exclude=.git --exclude=log .']
" let g:rails_ctags_arguments = ['--languages=Ruby --exclude=.git --exclude=log . $(bundle list --paths)']

" " ----------------------------------------------------------------------------
" " vim-ruby
" " ----------------------------------------------------------------------------
let g:ruby_indent_access_modifier_style = 'indent'
let g:ruby_indent_assignment_style = 'hanging'
"
" " ----------------------------------------------------------------------------
" " vim-go
" " ----------------------------------------------------------------------------
" nnoremap <leader>gr :GoRun<CR>
"
" " ----------------------------------------------------------------------------

" " ----------------------------------------------------------------------------
" vim-easy-align
" ----------------------------------------------------------------------------
nmap ga <Plug>(EasyAlign)

" ----------------------------------------------------------------------------
" dash
" ----------------------------------------------------------------------------
nnoremap <silent><leader>dd :Dash<CR>

" " ----------------------------------------------------------------------------
" " COC
" " ---------------------------------------------------------------------------- COC
" " inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" " inoremap <expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
" " inoremap <expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
"
" " nmap <silent> [d <Plug>(coc-diagnostic-prev)
" " nmap <silent> ]d <Plug>(coc-diagnostic-next)
" "
" " function! s:check_back_space() abort
" "   let col = col('.') - 1
" "   return !col || getline('.')[col - 1]  =~# '\s'
" " endfunction
"
" ----------------------------------------------------------------------------
" BufOnly
" ----------------------------------------------------------------------------
nnoremap <leader>bo :BufOnly<CR>

" ----------------------------------------------------------------------------
" Calendar
" ----------------------------------------------------------------------------
source ~/.cache/calendar.vim/credentials.vim 
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" ----------------------------------------------------------------------------
" quick-scope
" ----------------------------------------------------------------------------"""
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "css",
    "elixir",
    "hcl",
    "html",
    "javascript",
    "json",
    "lua",
    "ocaml",
    "python",
    "regex",
    "ruby",
    "rust",
    "scss",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vue",
    "yaml",
  },
  auto_install = true,
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },

  indent = {
    enable = false
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "vv",
      node_incremental = "vv",
      node_decremental = "vd",
    },
  },

  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  
  endwise = {
    enable = true
  },
  
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["am"] = "@function.outer",
        ["im"] = "@function.inner",
        ["mn"] = "@function.name",
        ["Mn"] = "@class.name",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  }
}
EOF

" " ----------------------------------------------------------------------------
" " toggleterm
" " ----------------------------------------------------------------------------
lua <<EOF
require("toggleterm").setup{}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit", 
  direction = "float",
  float_opts = { 
    border = "double",
    height = 35 
  }
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
EOF

nnoremap <F1> :ToggleTerm1 size=20<CR>
nnoremap <F2> :ToggleTerm2 size=20<CR>
nnoremap <F3> :ToggleTerm3 size=20<CR>
nnoremap <F5> :ToggleTermToggleAll<CR>
tnoremap <F1> <C-\><C-N>:ToggleTerm1<CR>
tnoremap <F2> <C-\><C-N>:ToggleTerm2<CR>
tnoremap <F3> <C-\><C-N>:ToggleTerm3<CR>
tnoremap <F5> <C-\><C-N>:ToggleTermToggleAll<CR>



" " ----------------------------------------------------------------------------
" " hop
" " ----------------------------------------------------------------------------
lua <<EOF
require'hop'.setup()
EOF

nnoremap <leader><leader>w :HopWordAC<CR>
nnoremap <leader><leader>b :HopWordBC<CR>
nnoremap <leader><leader>l :HopLineStart<CR>

" " ----------------------------------------------------------------------------
" "  LuaSnip
" " ----------------------------------------------------------------------------
lua <<EOF
local luasnip = require('luasnip')

require('luasnip/loaders/from_vscode').lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load({paths = "~/.config/nvim/snippets"})
luasnip.filetype_extend("ruby", {"rails"})
luasnip.filetype_extend("vue", {"javascript"})

vim.keymap.set("i", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.keymap.set("s", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.keymap.set("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
vim.keymap.set("s", "<C-p>", "<Plug>luasnip-prev-choice", {})
vim.keymap.set("i", "<C-j>", "<Plug>luasnip-jump-next", {})
EOF

imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
"
" imap <silent><expr> <Tab> <cmd>lua require('luasnip').expand()<Cr>
"
" snoremap <silent> <C-j> <cmd>lua require('luasnip').jump(1)<Cr>
" snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<Cr>

" ----------------------------------------------------------------------------
"  Copilot
" ----------------------------------------------------------------------------
imap <silent><script><expr> <A-s> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" ----------------------------------------------------------------------------
" alpha-nvim
" ----------------------------------------------------------------------------
lua <<EOF
require'alpha'.setup(require'alpha.themes.startify'.config)
EOF

" " ----------------------------------------------------------------------------
" " nvim-lsp
" " ----------------------------------------------------------------------------
lua <<EOF

vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  signs = true,
  update_in_insert = true,
  float = {
    border = 'single'
  }
})

local opts = { noremap=true, silent=true }

local diagnosticGoToNext = function()
  vim.diagnostic.goto_next({ float = true })
end

local diagnosticGoToPrev = function()
  vim.diagnostic.goto_prev({ float = true })
end

vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', diagnosticGoToNext, opts)
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local cmp = require 'cmp'
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local lspkind = require('lspkind')

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
cmp.setup({
  formatting = {
    format = lspkind.cmp_format(),
  },
  window = {
    completion = cmp.config.window.bordered {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    },
    documentation = cmp.config.window.bordered {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    },
  },
  snippets = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { 
      name = 'nvim_lsp',
      max_item_count = 10,
    },
    { 
      name = 'luasnip',
      max_item_count = 10,
    },
    { 
      name = 'buffer', 
      max_item_count = 10,
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      }
    }
  })
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require("mason").setup({
  ui = {
    border = 'single',
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup({
  automatic_installation = true
})

require 'lspconfig'.solargraph.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    solargraph = {
      diagnostics = false
    }
  }
}

require 'lspconfig'.vuels.setup{
  on_attach = on_attach,
  capabilities = capabilities
}

require 'lspconfig'.tsserver.setup{
  on_attach = on_attach,
  capabilities = capabilities
}
EOF

" ----------------------------------------------------------------------------
" null-ls
" ----------------------------------------------------------------------------
lua <<EOF
local null_ls = require("null-ls")
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local file_types = { 
  "markdown", 
  "ruby", 
  "javascript", 
  "elixir",
  "yaml",
  "vue" 
}
null_ls.setup({
  diagnostics_format = "[#{c}] #{m} (#{s})",
  update_in_insert = true,
  sources = {
    diagnostics.cspell.with({
      filetypes = filetypes,
    }),
    code_actions.cspell.with({
      filetypes = filetypes,
    }),

    code_actions.eslint,
    diagnostics.eslint,
    formatting.eslint,

    diagnostics.rubocop.with({
      condition = function(utils)
        return utils.root_has_file(".rubocop.yml")
      end,
    }),
    formatting.rubocop.with({
      condition = function(utils)
        return utils.root_has_file(".rubocop.yml")
      end,
    }),

    
    formatting.standardrb.with({
      -- disable standardrb when root has .rubocop.yml
      condition = function(utils)
        return not utils.root_has_file(".rubocop.yml")
      end
    }),

    diagnostics.standardrb.with({
      condition = function(utils)
        return not utils.root_has_file(".rubocop.yml")
      end,
    }),
    -- diagnostics.erb_lint.with({ filetypes = { "eruby" }}),
    -- formatting.erb_lint.with({ filetypes = { "eruby" }}),
    formatting.prettier.with({
      filetypes = { "html", "json", "yaml", "markdown" },
    })
  }
})
EOF

" ----------------------------------------------------------------------------
" Comment
" ----------------------------------------------------------------------------
lua require('Comment').setup()

" ----------------------------------------------------------------------------
" nvim-tree
" ----------------------------------------------------------------------------
lua <<EOF
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  view = {
    adaptive_size = true
  }
})

vim.keymap.set("n", "<leader>mn", require("nvim-tree.api").marks.navigate.next)
vim.keymap.set("n", "<leader>mp", require("nvim-tree.api").marks.navigate.prev)
vim.keymap.set("n", "<leader>ms", require("nvim-tree.api").marks.navigate.select)

EOF


nnoremap <silent><C-\> :NvimTreeToggle<CR>

" ----------------------------------------------------------------------------
" nvim-autopairs
" ----------------------------------------------------------------------------
lua <<EOF
require("nvim-autopairs").setup {
  check_ts = true
}
EOF

" ----------------------------------------------------------------------------
" neogen
" ----------------------------------------------------------------------------"
lua <<EOF
require('neogen').setup({ 
  snippet_engine = "luasnip",
})

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
EOF

" ----------------------------------------------------------------------------
" aerial
" ----------------------------------------------------------------------------"
lua <<EOF
require('aerial').setup({
  backends = { "treesitter" },
  layout = {
    min_width = 0.25,
    default_direction = 'prefer_left'
  },
  on_attach = function(bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ol', '<cmd>AerialToggle!<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '{', '<cmd>AerialPrev<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '}', '<cmd>AerialNext<CR>', {})
    -- Jump up the tree with '[[' or ']]'
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrevUp<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNextUp<CR>', {})
  end
})
EOF

" ----------------------------------------------------------------------------
" vim-maximizer
" ----------------------------------------------------------------------------"
let g:maximizer_default_mapping_key = '<F5>'
