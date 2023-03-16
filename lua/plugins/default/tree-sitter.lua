return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        rainbow = {
          enable = true,
          -- list of languages you want to disable the plugin for
          disable = { "jsx", "cpp" },
          -- Which query to use for finding delimiters
          query = "rainbow-parens",
          -- Highlight the entire buffer all at once
        },
      })
    end,
    opts = function()
      return {
        highlight = { enable = true },
        indent = { enable = true, disable = { "python" } },
        context_commentstring = { enable = true, enable_autocmd = false },
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "help",
          "html",
          "json",
          "lua",
          "luap",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "regex",
          "vim",
          "yaml",
          "latex",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<cr>",
            node_incremental = "<cr>",
            scope_incremental = "\\",
            node_decremental = "<bs>",
          },
        },
      }
    end,
    keys = function()
      return {
        { "<cr>", desc = "Increment selection" },
        { "<bs>", desc = "Decrement selection", mode = "x" },
      }
    end,
  },
}
