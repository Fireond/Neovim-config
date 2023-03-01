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

-- map({ "n", "v" }, "J", "5j", { desc = "J = 5j" })
-- map({ "n", "v" }, "K", "5k", { desc = "K = 5k" })
-- Better movement
map({ "n", "v", "o" }, "H", "^", { desc = "Use 'H' as '^'" })
map({ "n", "v", "o" }, "L", "$", { desc = "Use 'L' as '$'" })

-- indent for normal mode
map("n", "<", "v<g")
map("n", ">", "v>g")

-- buffers
if Util.has("bufferline.nvim") then
  map({ "n", "i" }, "<A-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<leader>k", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map({ "n", "i" }, "<A-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
  map("n", "<leader>j", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
  map({ "n", "i" }, "<A-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map({ "n", "i" }, "<A-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
end
map("n", "<leader>D", "<C-W>c", { desc = "Delete window" })

-- go to files
map("n", "<leader>go", "<cmd>e ~/.config/nvim/lua/config/options.lua<cr>", { desc = "Go to options config" })
map("n", "<leader>gk", "<cmd>e ~/.config/nvim/lua/config/keymaps.lua<cr>", { desc = "Go to keymaps config" })
map("n", "<leader>gs", function()
  require("luasnip.loaders").edit_snippet_files({})
end, { desc = "Go to luasnip config" })
map("n", "<leader>gp", "<cmd>e ~/.config/nvim/lua/plugins/r-default.lua<cr>", { desc = "Go to plugins config" })
map(
  "n",
  "<leader>gl",
  "<cmd>e ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/init.lua<cr>",
  { desc = "Go to lazyvim config" }
)

-- Spell check
map({ "i", "n" }, "<C-d>", "<C-g>u<Esc>[s1z=`]a<C-g>u")
map("n", "<leader>h", "a<C-g>u<Esc>[s1z=`]a<C-g>u<Esc>", { desc = "Check Spell" })
-- Lazy
map("n", "<leader>L", "<cmd>:Lazy<cr>", { desc = "Lazy" })
-- Save file
map("n", "<leader>w", "<cmd>:w<cr>", { desc = "Save" })
-- Toggle terminal
map("n", "<leader>t", "<cmd>ToggleTerm<cr>")
-- Toggle transparent
map("n", "<leader>ut", "<cmd>TransparentToggle<cr>")
map("n", "<leader>z", "zt", { desc = "Top this line" })

-- Disable default keymaps
local del = vim.keymap.del
del("n", "<leader>bb")
del("n", "<leader>ww")
del("n", "<leader>wd")
del("n", "<leader>w-")
del("n", "<leader>w|")
del("n", "<leader>l")
del("n", "<leader>ft")
del("n", "<leader>fT")
del("n", "<leader>gg")
del("n", "<leader>gG")
