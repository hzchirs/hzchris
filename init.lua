vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.cmd('packadd! matchit')

require("lazy").setup({
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  {
    "L3MON4D3/LuaSnip",
    -- version = "<CurrentMajor>.*",
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    config = function()
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
    end
  },
  {
    'goolord/alpha-nvim',
    config = function()
      require('alpha').setup(require('alpha.themes.startify').config)
    end
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig'
    },
    config = function()
      local null_ls = require("null-ls")
      local code_actions = null_ls.builtins.code_actions
      local diagnostics = null_ls.builtins.diagnostics
      local formatting = null_ls.builtins.formatting


      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      vim.keymap.set('n', '<leader><leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)

      null_ls.setup({
        diagnostics_format = "[#{c}] #{m} (#{s})",
        sources = {
          -- diagnostics.cspell,
          -- code_actions.cspell,

          code_actions.eslint,
          diagnostics.eslint,
          formatting.eslint,

          -- https://github.com/jose-elias-alvarez/null-ls.nvim/discussions/764
          diagnostics.rubocop.with({
            command = "bundle",
            args = vim.list_extend({ "exec", "rubocop" }, diagnostics.rubocop._opts.args),
            condition = function(utils)
              return utils.root_has_file(".rubocop.yml")
            end,
          }),

          formatting.rubocop.with({
            command = "bundle",
            args = vim.list_extend({ "exec", "rubocop" }, formatting.rubocop._opts.args),
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
            filetypes = { "json", "yaml", "markdown" },
          })
        }
      })
    end
  },
  -- outline
  {
    'stevearc/aerial.nvim',
    dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require('aerial').setup({
        backends = { "treesitter" },
        layout = {
          min_width = 0.4,
          default_direction = 'prefer_right'
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
    end
  },
  {
    'kyazdani42/nvim-tree.lua',
    config = function()
      vim.g.loaded = 1
      vim.g.loaded_netrwPlugin = 1

      require("nvim-tree").setup({
        view = {
          adaptive_size = true
        }
      })

      local api = require("nvim-tree.api")

      vim.keymap.set("n", "<leader>mn", api.marks.navigate.next)
      vim.keymap.set("n", "<leader>mp", api.marks.navigate.prev)
      vim.keymap.set("n", "<leader>ms", api.marks.navigate.select)

      vim.keymap.set('n', '<C-\\>', api.tree.toggle)
    end
  },
  {
    'junegunn/gv.vim',
    dependencies = { 'tpope/vim-fugitive' }
  },
  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    'junegunn/fzf',
    build = ':call fzf#install()',
    dependencies = { 'junegunn/fzf.vim' },
    config = function()
      vim.g.fzf_layout = { window = { width = 0.9, height = 0.9 } }
      vim.g.fzf_history_dir = '~/.local/share/fzf-history'

      vim.keymap.set('n', '<C-p>', ':Files<CR>')
      vim.keymap.set('n', '<S-p>', ':Buffers<CR>')
      vim.keymap.set('n', '<leader>fh', ':History<CR>')
      vim.cmd [[
        command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, "--ignore=yarn.lock --ignore=vendor/ --ignore='spec/fixtures/**/*.yml'", fzf#vim#with_preview(), <bang>0)
      ]]
      function SearchVisualSelectionWithAg(range)
        local old_reg = vim.fn.getreg("\"")
        local old_regtype = vim.fn.getregtype("\"")
        local old_clipboard = vim.o.clipboard
        vim.o.clipboard = true
        vim.cmd("normal! \"\"gvy")
        local selection = vim.fn.getreg("\"")
        vim.fn.setreg("\"", old_reg, old_regtype)
        vim.o.clipboard = old_clipboard
        vim.cmd("Ag " .. selection)
      end

      vim.keymap.set('v', '<S-k>', ':lua SearchVisualSelectionWithAg()<CR>')

      function SearchWordWithAg()
        local word = vim.fn.expand("<cword>")
        vim.cmd("Ag " .. word)
      end

      vim.keymap.set('n', '<S-k>', ':lua SearchWordWithAg()<CR>')

      function ag_in(path)
        if not vim.fn.isdirectory(path) then
          error(string.format("not a valid directory: %s", path))
        end
        local fzf_opts = 'right:50%'

        vim.fn['fzf#vim#ag']('', vim.fn['fzf#vim#with_preview']({ dir = path }, fzf_opts))
      end

      vim.api.nvim_create_user_command(
        'AgIn',
        'lua ag_in(<f-args>)',
        {
          nargs = '+',
          bang = true,
          complete = 'dir'
        }
      )
    end
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<F1>]],
        size = 20
      })

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

      function _G.set_terminal_keymaps()
        local opts = {buffer = 0}
        vim.keymap.set('t', '``', [[<C-\><C-n>]], opts)
      end

      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end
  },

  {
    'neovim/nvim-lspconfig',
    config = function()
      require('lspconfig.ui.windows').default_options.border = 'single'
      vim.diagnostic.config({
        virtual_text = false,
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
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts) -- 和 go replace 相衝突
        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
      end

      local lspconfig = require('lspconfig')

      lspconfig.solargraph.setup{
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          solargraph = {
            diagnostics = false
          }
        }
      }

      lspconfig.vuels.setup{
        on_attach = on_attach,
        capabilities = capabilities
      }
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      'onsails/lspkind.nvim',
      'saadparwaiz1/cmp_luasnip'
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require("luasnip")
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
        experimental = {
          ghost_text = false -- this feature conflict with copilot.vim's preview.
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
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          {
            name = 'nvim_lsp',
            group_index = 2
          },
          {
            name = 'luasnip',
            group_index = 2
          },
          {
            name = 'buffer',
            group_index = 2,
            option = {
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end
            }
          }
        })
      })
    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    end,
  },

  -- copilot
  {
    'github/copilot.vim'
  },
  -- {
  --   'zbirenbaum/copilot.lua',
  --   config = function()
  --     require("copilot").setup({
  --       panel = {
  --         auto_refresh = false,
  --       },
  --       suggestion = {
  --         auto_trigger = true,
  --         keymap = {
  --           accept = false,
  --           next = "<A-]>",
  --           prev = "<A-[>",
  --         }
  --       },
  --     })
  --
  --     vim.keymap.set('i', '<Tab>', function()
  --       if require("copilot.suggestion").is_visible() then
  --         require("copilot.suggestion").accept()
  --       else
  --         vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  --       end
  --     end, { desc = "Super Tab" })
  --   end
  -- },

  -- buffer management
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons'
    },
    version = '1.6.5',
    config = function()
      local opts = { silent = true }
      vim.keymap.set('n', '<A-{>', ':BufferPrevious<CR>', opts)
      vim.keymap.set('n', '<A-}>', ':BufferNext<CR>', opts)
      vim.keymap.set('n', '<A-[>', ':BufferMovePrevious<CR>', opts)
      vim.keymap.set('n', '<A-]>', ':BufferMoveNext<CR>', opts)
      vim.keymap.set('n', '<S-x>', ':BufferClose<CR>', opts)
    end
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = { theme = 'material' }
        -- options = { theme = 'tokyonight' }
      })
    end
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup()
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          "c",
          "css",
          "elixir",
          "hcl",
          "html",
          "embedded_template",
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
          "markdown_inline"
        },
        auto_install = true,
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true
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
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' }
  },
  {
    'nvim-treesitter/playground',
    dependencies = { 'nvim-treesitter/nvim-treesitter' }
  },
  {
    'RRethy/nvim-treesitter-endwise',
    dependencies = { 'nvim-treesitter/nvim-treesitter' }
  },

  {
    'hzchirs/vim-material',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    dev = true,
    dir = '~/Projects/vim-material',
    priority = 1000
  },

  {
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup {
        check_ts = true
      }
    end
  },

  -- 縮排輔助線
  {
    'lukas-reineke/indent-blankline.nvim',
    version = '2.20.8',
    config = function()
      require("indent_blankline").setup {
        show_current_context = true -- highlight 目前游標所在的 context
      }
    end
  },

  {
    'ggandor/leap.nvim',
    dependencies = { 'tpope/vim-repeat' },
    config = function()
      require('leap').add_default_mappings()
    end
  },
  -- ipython, jupyter
  {
    "WhiteBlackGoose/magma-nvim-goose",
    version = "*",
    build = ":UpdateRemotePlugins",
    config = function()
      vim.keymap.set('n', '<leader>mi', ':MagmaInit<CR>')
      vim.keymap.set('n', '<leader>mo', ':MagmaEvaluateOperator<CR>')
      vim.keymap.set('n', '<leader>me', ':MagmaEvaluateLine<CR>')
      vim.keymap.set('x', '<leader>me', ':<C-u>MagmaEvaluateVisual<CR>')
      vim.keymap.set('n', '<leader>mc', ':MagmaReevaluateCell<CR>')
      vim.keymap.set('n', '<leader>mr', ':MagmaRestart!<CR>')
      vim.keymap.set('n', '<leader>mx', ':MagmaInterrupt<CR>')
    end
  },

  -- 一直有 bug，先暫時註解，改用 leap.nvim
  -- {
  --   'phaazon/hop.nvim',
  --   branch = 'v2',
  --   config = function()
  --     require'hop'.setup()
  --
  --     local hop = require('hop')
  --     local directions = require('hop.hint').HintDirection
  --     vim.keymap.set('', 'f', function()
  --       hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
  --     end, {remap=true})
  --     vim.keymap.set('', 'F', function()
  --       hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
  --     end, {remap=true})
  --     vim.keymap.set('', 't', function()
  --       hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
  --     end, {remap=true})
  --     vim.keymap.set('', 'T', function()
  --       hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
  --     end, {remap=true})
  --     vim.keymap.set('', '<leader><leader>w', function()
  --     	hop.hint_words({ direction = directions.AFTER_CURSOR })
  --     end)
  --     vim.keymap.set('', '<leader><leader>b', function()
  --     	hop.hint_words({ direction = directions.BEFORE_CURSOR })
  --     end)
  --   end
  -- },
  {
    'mg979/vim-visual-multi',
    branch = 'master'
  },
  {
    'vim-scripts/BufOnly.vim',
    config = function()
      vim.keymap.set('n', '<leader>bo', ':BufOnly<CR>')
    end
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      highlight = {
        multiline = true
      }
    },
    config = function(_, opts)
      require("todo-comments").setup(opts)
    end
  },
  -- 專注模式
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({
        on_open = function(win)
          oldwrap = vim.wo.wrap
          oldcc = vim.wo.colorcolumn
          vim.wo.wrap = true
          vim.wo.colorcolumn = ""
        end,

        on_close = function()
          vim.wo.wrap = oldwrap
          vim.wo.colorcolumn = oldcc
        end,

        window = {
          backdrop = 1,
          width = 80,
          options = {
            signcolumn = "no",
            foldcolumn = "0",
            number = false,
            relativenumber = false,
            cursorline = false,
            cursorcolumn = false
          }
        }
      })
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'tpope/vim-rails',
    config = function()
      -- disable autocmd set filetype=eruby.yaml
      vim.api.nvim_create_autocmd(
        { 'BufNewFile', 'BufReadPost' },
        {
          pattern = { '*.yml' },
          callback = function()
            vim.bo.filetype = 'yaml'
          end

        }
      )
    end
  },
  {
    'junegunn/vim-easy-align',
    config = function()
      vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)', {noremap=false})
      vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)', {noremap=false})
    end
  },

  {
    'SidOfc/mkdx',
    ft = 'markdown',
  },

  {
    'itchyny/calendar.vim',
    config = function()
      vim.g.calendar_google_calendar = 1
      vim.g.calendar_google_task = 1
    end
  },

  'vim-scripts/ReplaceWithRegister',
  'mattn/emmet-vim',
  'chrisbra/Colorizer',
  'AndrewRadev/splitjoin.vim',
  'matze/vim-move',
  'michaeljsmith/vim-indent-object',
  'christoomey/vim-sort-motion',
  -- 讓 vim 的 command line mode 支援 command line 快捷鍵
  'ryvnf/readline.vim',

  -- A Vim plugin to provide %-style motion for ' (single quotation mark),
  -- " (double quotation mark), ` (backtick), and | (pipe).
  'airblade/vim-matchquote',

  -- eunuch.vim: Helpers for UNIX
  -- :Remove, :Delete, :Move ...etc
  'tpope/vim-eunuch',
  'gpanders/editorconfig.nvim',
  'rizzatti/dash.vim',
  'metakirby5/codi.vim',
})

if not vim.g.vscode then
  vim.cmd [[colorscheme vim-material]]
  -- vim.cmd [[colorscheme tokyonight]]
end

-- Basic Settings
vim.g.mapleader = ' '
vim.opt.undofile = true -- Maintain undo history between sessions
vim.opt.regexpengine = 1
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.foldmethod = 'expr'
vim.opt.foldlevel = 20
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

vim.opt.shell= 'zsh'
vim.opt.clipboard:append('unnamed')
vim.opt.cursorline = true
vim.opt.lazyredraw = true
vim.opt.autoindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.colorcolumn = '100'
vim.opt.signcolumn = 'yes'
vim.opt.wrap = false
vim.opt.scrolloff = 999 -- 游標置中
vim.opt.sidescrolloff = 5
vim.opt.mouse = 'a'
vim.opt.termguicolors = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.background = 'dark'

-- -- Key mappings
vim.keymap.set('n', '<silent><leader>rr', ':!ruby %<CR>', { desc = 'Run current ruby file' })
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', '<S-L>', '10zl')
vim.keymap.set('n', '<S-H>', '10zh')

vim.keymap.set('n', '<leader>ev', ':vsplit $MYVIMRC<CR>')
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<CR>')

-- quick note 相關設定
vim.cmd [[
  command! QuickNote :lua QuickNote()
]]

function QuickNote()
  if vim.g.quicknote_winnr then
    local winnr = vim.g.quicknote_winnr
    if vim.fn.win_gotoid(winnr) and vim.fn.winnr('$') > 1 then
      vim.cmd("close")
    end
    vim.g.quicknote_winnr = nil
  else
    -- 在右側創建新的垂直分割窗口
    vim.cmd("rightbelow vsplit ~/vim-quick-note.md")
    vim.cmd("vertical resize 60")
    vim.cmd("setlocal nobuflisted") -- 使筆記不出現在 buffer 列表中
    vim.g.quicknote_winnr = vim.fn.win_getid()
  end
end

vim.keymap.set('n', '<leader>qn', ':QuickNote<CR>')

-- 存檔前自動移除行尾空白
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

--- 縮放視窗
vim.keymap.set('n', '<leader><leader>=', ':exe "vertical resize " . (winwidth(0) * 10/9)<CR>')
vim.keymap.set('n', '<leader><leader>-', ':exe "vertical resize " . (winwidth(0) * 9/10)<CR>')

-- 切換 normal mode
vim.keymap.set('i', 'jk', '<Esc>')

--- 模擬 Emacs 操作
vim.keymap.set('i', '<C-e>', '<esc>A')
vim.keymap.set('i', '<C-a>', '<esc>I')
vim.keymap.set('i', '<C-f>', '<right>')
vim.keymap.set('i', '<C-b>', '<left>')
vim.keymap.set('i', '<C-n>', '<down>')
vim.keymap.set('i', '<C-p>', '<up>')
vim.keymap.set('i', '<C-o>', '<esc>O')

-- Search visual context
vim.keymap.set('v', '//', 'y/<C-R>"<CR>')

-- 各種模式下的 Ctrl-s 儲存
vim.keymap.set('n', '<C-s>', ':update<CR>')
vim.keymap.set('v', '<C-s>', '<C-C>:update<CR>')
vim.keymap.set('i', '<C-s>', '<C-O>:update<CR><Right>')

-- Smart way to move between windows
vim.keymap.set('n', '<C-j>', '<C-W>j')
vim.keymap.set('n', '<C-k>', '<C-W>k')
vim.keymap.set('n', '<C-l>', '<C-W>l')
vim.keymap.set('n', '<C-h>', '<C-W>h')
