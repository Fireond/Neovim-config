-- ============= --
-- Vimtex Config --
-- ============= --
vim.opt.conceallevel = 2
vim.g.vimtex_view_method = "skim"
vim.g.vimtex_quickfix_mode = 2
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_compiler_silent = 1
vim.g.vimtex_view_general_options = "-r @line @pdf @tex"
vim.g.vimtex_indent_enabled = 1
vim.g.vimtex_imaps_enabled = 0
-- Custom conceasl
vim.cmd([[
let g:vimtex_syntax_custom_cmds = [
  \ {'name': 'limits', 'mathmode': 1, 'concealchar': ' '},
  \ {'name': 'dd', 'mathmode': 1, 'concealchar': 'd'},
  \ {'name': 'cp', 'mathmode': 1, 'concealchar': 'x'},
  \ {'name': 'order', 'mathmode': 1, 'concealchar': 'O'},
  \ {'name': 'rank', 'mathmode': 1, 'concealchar': 'r'},
  \ {'name': 'vb', 'mathmode': 1, 'conceal': 1, 'argstyle': 'boldunder'},
  \]
]])
vim.cmd([[
let g:vimtex_syntax_custom_cmds_with_concealed_delims = [
  \ {'name': 'ket', 'mathmode': 1, 'cchar_open': '|', 'cchar_close': '>'},
  \ {'name': 'bra', 'mathmode': 1, 'cchar_open': '<', 'cchar_close': '|'},
  \ {'name': 'abs', 'mathmode': 1, 'cchar_open': '|', 'cchar_close': '|'},
  \ {'name': 'norm', 'mathmode': 1, 'cchar_open': '⫼', 'cchar_close': '⫼'},
  \ {'name': 'ceil', 'mathmode': 1, 'cchar_open': '⌈', 'cchar_close': '⌉'},
  \ {'name': 'floor', 'mathmode': 1, 'cchar_open': '⌊', 'cchar_close': '⌋'},
  \]
]])

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

map({ "o", "x" }, "am", "<Plug>(vimtex-a$)", { desc = "Use `am` for the inline math text object" })
map({ "o", "x" }, "im", "<Plug>(vimtex-i$)", { desc = "Use `im` for the inline math text object" })
map({ "o", "x" }, "ai", "<Plug>(vimtex-am)", { desc = "Use `ai` for the item text text object" })
map({ "o", "x" }, "ii", "<Plug>(vimtex-im)", { desc = "Use `ii` for the item text text object" })
