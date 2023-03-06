return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip").config.set_config({
        enable_autosnippets = true,
        store_selection_keys = "`",
      })
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip" })
    end,
    keys = function()
      return {
        {
          "fj",
          function()
            return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next"
              or "<c-\\><c-n>:call searchpair('[([{]', '', '[)\\]}]', 'W')<cr>a"
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
            require("luasnip").jump(-1)
          end,
          mode = { "i", "s" },
        },
      }
    end,
  },
}
