-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "J", "5j", { desc = "J = 5j" })
map("n", "K", "5k", { desc = "K = 5k" })
map("v", "J", "5j", { desc = "J = 5j" })
map("v", "K", "5k", { desc = "K = 5k" })
map("n", ";", ":", { desc = "Use ';' as ':'" })
map("n", "H", "^", { desc = "Use 'H' as '^'" })
map("n", "L", "$", { desc = "Use 'L' as '$'" })
map("v", "H", "^", { desc = "Use 'H' as '^'" })
map("v", "L", "$", { desc = "Use 'L' as '$'" })
map("o", "H", "^", { desc = "Use 'H' as '^'" })
map("o", "L", "$", { desc = "Use 'L' as '$'" })

-- indent for normal mode
map("n", "<", "v<g")
map("n", ">", "v>g")

-- buffers
if Util.has("bufferline.nvim") then
  map("n", "<A-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<A-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
  map("n", "<A-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "<A-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
end
vim.keymap.set("n", "<leader>d", function()
  vim.api.nvim_buf_delete(0, {})
end, { desc = "Delete Buffer" })

map("n", "<leader>to", "<cmd>e ~/.config/nvim/lua/config/options.lua<cr>", { desc = "Go to options config" })
map("n", "<leader>tk", "<cmd>e ~/.config/nvim/lua/config/keymaps.lua<cr>", { desc = "Go to keymaps config" })
map("n", "<leader>ts", "<cmd>e ~/.config/nvim/LuaSnip/all.lua<cr>", { desc = "Go to luasnip config" })
map("n", "<leader>tp", "<cmd>e ~/.config/nvim/lua/plugins/init.lua<cr>", { desc = "Go to plugins config" })
map(
  "n",
  "<leader>tl",
  "<cmd>e ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/init.lua<cr>",
  { desc = "Go to lazyvim config" }
)
