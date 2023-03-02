return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip").config.set_config({
        enable_autosnippets = true,
        store_selection_keys = "<Tab>",
      })
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip" })
    end,
    keys = {
      {
        "fj",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "fj"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
      {
        "fj",
        function()
          require("luasnip").jump(1)
        end,
        mode = "s",
      },
      {
        "fk",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "fk"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
      {
        "fk",
        function()
          require("luasnip").jump(1)
        end,
        mode = "s",
      },
      {
        "<C-l>",
        function()
          return require("luasnip.extras.select_choice")()
        end,
        mode = { "i", "s" },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require("cmp")
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<S-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<S-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-n>"] = cmp.mapping.scroll_docs(-4),
          ["<C-p>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-f>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-f>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = function(_, item)
            local icons = require("lazyvim.config").icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "K", "a<cr><Esc>k$" }
    end,
  },
  {
    "folke/which-key.nvim",
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      local keymaps = {
        mode = { "n", "v" },
        ["gz"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "+tabs" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>g"] = { name = "+go to" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>u"] = { name = "+ui" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
        ["<leader>l"] = { name = "+vimtex" },
        ["<leader>sn"] = { name = "+noice" },
      }
      wk.register(keymaps)
    end,
    opts = {
      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "f", "j" },
        v = { "f", "k" },
      },
    },
  },
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys =  function ()
      return {
      { "<leader>d", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
    }
    end ,
  },
  {
    "akinsho/bufferline.nvim",
    keys = function()
      return {}
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enable = true,
        disable = { "latex" },
        additional_vim_regex_highlighting = { "markdown" },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>gc", false },
      { "<leader>gs", false },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function()
        return {}
      end,
    },
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "ma", -- Add surrounding in Normal and Visual modes
        delete = "md", -- Delete surrounding
        find = "mf", -- Find surrounding (to the right)
        find_left = "mF", -- Find surrounding (to the left)
        highlight = "mh", -- Highlight surrounding
        replace = "mr", -- Replace surrounding
        update_n_lines = "mn", -- Update `n_lines`
      },
    },
    config = function(_, opts)
      require("mini.surround").setup(opts)
    end,
  },
}
