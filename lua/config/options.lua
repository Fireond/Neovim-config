-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.timeoutlen = 200
vim.opt.spell = true
vim.opt.spelllang = { "nl", "en" }
-- ======================= --
-- Set line wrap and break --
-- ======================= --
vim.g.wrap = true
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.showbreak = ">>"

-- ============= --
-- Vimtex Config --
-- ============= --
vim.opt.conceallevel = 2
vim.g.vimtex_view_method = "skim"
vim.g.vimtex_view_automatic = 0
vim.g.vimtex_quickfix_ignore_mode = 0
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_compiler_silent = 1
vim.g.vimtex_view_general_options = "-r @line @pdf @tex"
vim.g.vimtex_indent_enabled = 0
-- Custom conceasl
vim.cmd([[
let g:vimtex_syntax_custom_cmds = [
  \ {'name': 'limits', 'mathmode': 1, 'concealchar': ' '},
  \ {'name': 'dd', 'mathmode': 1, 'concealchar': 'd'},
  \ {'name': 'cp', 'mathmode': 1, 'concealchar': 'x'},
  \ {'name': 'rank', 'mathmode': 1, 'concealchar': 'r'},
  \ {'name': 'vb', 'mathmode': 1, 'conceal': 1, 'argstyle': 'boldunder'},
  \]
]])
vim.cmd([[
let g:vimtex_syntax_custom_cmds_with_concealed_delims = [
          \ {'name': 'ket',
          \  'mathmode': 1,
          \  'conceal': 0,
          \  'cchar_open': '|',
          \  'cchar_close': '>'},
          \]
]])

-- =============== --
-- Markdown Config --
-- =============== --
