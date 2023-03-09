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

map("i", "<C-d>", function()
  -- require("utils.latex").in_env("a")
  local ts_utils = require("nvim-treesitter.ts_utils")
end)

-- movement
map({ "n", "v", "o" }, "H", "^", { desc = "Use 'H' as '^'" })
map({ "n", "v", "o" }, "L", "$", { desc = "Use 'L' as '$'" })

-- indent for normal mode
map("n", "<", "v<g")
map("n", ">", "v>g")

-- buffers
map({ "n", "i" }, "<A-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<leader>k", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map({ "n", "i" }, "<A-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<leader>j", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<leader>D", "<C-W>c", { desc = "Delete window" })

-- windows resize
map("n", "<Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- go to files
map("n", "<leader>go", "<cmd>e ~/.config/nvim/lua/config/options.lua<cr>", { desc = "Go to options config" })
map("n", "<leader>gk", "<cmd>e ~/.config/nvim/lua/config/keymaps.lua<cr>", { desc = "Go to keymaps config" })
map("n", "<leader>gs", function()
  require("luasnip.loaders").edit_snippet_files({})
end, { desc = "Go to luasnip config" })
map("n", "<leader>gp", "<cmd>e ~/.config/nvim/lua/plugins/default.lua<cr>", { desc = "Go to plugins config" })
map("n", "<leader>gf", "<cmd>e ~/.config/nvim/ftplugin/tex.lua<cr>", { desc = "Go to file type plugin" })
map(
  "n",
  "<leader>gl",
  "<cmd>e ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/init.lua<cr>",
  { desc = "Go to lazyvim config" }
)

-- Spell check
-- map({ "i", "n" }, "<C-d>", "<C-g>u<Esc>[s1z=`]a<C-g>u", { desc = "Check spell" })
map("n", "<leader>h", "a<C-g>u<Esc>[s1z=`]a<C-g>u<Esc>", { desc = "Check spell" })
map("n", "<leader>H", "a<C-g>u<Esc>[szg`]a<C-g>u<Esc>", { desc = "Add word to dictionary" })

map("n", "<leader>L", "<cmd>:Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>w", "<cmd>:w<cr>", { desc = "Save" })
map("n", "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
map("n", "<leader>ut", "<cmd>TransparentToggle<cr>", { desc = "Toggle transparent" })
map("n", "<leader>uc", Util.telescope("colorscheme", { enable_preview = true }), { desc = "Colorscheme with preview" })
map("n", "<leader>ua", "<cmd>ASToggle<cr>", { desc = "Toggle auto save" })
map("n", "<leader>z", "zz", { desc = "Center this line" })
map({ "n", "v" }, "<leader>a", "<cmd>keepjumps normal! ggVG<cr>", { desc = "Select all" })
map("n", "<leader>+", "<C-a>", { desc = "Increase number" })
map("n", "<leader>-", "<C-x>", { desc = "Decrease number" })

-- ============= --
-- Vimtex Keymaps --
-- ============= --
-- map({ "o", "x" }, "am", "<Plug>(vimtex-a$)", { desc = "Use `am` for the inline math text object" })
-- map({ "o", "x" }, "im", "<Plug>(vimtex-i$)", { desc = "Use `im` for the inline math text object" })
-- map({ "o", "x" }, "ai", "<Plug>(vimtex-am)", { desc = "Use `ai` for the item text text object" })
-- map({ "o", "x" }, "ii", "<Plug>(vimtex-im)", { desc = "Use `ii` for the item text text object" })

-- map({ "i", "n", "v" }, "<C-b>", function()
--   require("knap").toggle_autopreviewing()
-- end)
-- map({ "i", "n", "v" }, "<C-x>", function()
--   require("knap").forward_jump()
-- end)
-- map({ "n", "v" }, "<leader>K", function()
--   require("knap").process_once()
-- end)

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
