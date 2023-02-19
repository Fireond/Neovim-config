-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip/" })
require("luasnip").config.set_config({ -- Setting LuaSnip config
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
})
