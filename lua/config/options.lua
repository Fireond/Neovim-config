-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- ============= --
-- Vimtex Config --
-- ============= --
vim.opt.conceallevel = 2
vim.g.vimtex_view_method = "skim"
-- Do not open pdfviwer on compile
vim.g.vimtex_view_automatic = 0
-- Disable quickfix auto open
vim.g.vimtex_quickfix_ignore_mode = 0
-- Do not auto open quickfix on compile erros
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_view_general_options = "-r @line @pdf @tex"
-- Custom conceasl
vim.cmd([[
let g:vimtex_syntax_custom_cmds = [
  \ {'name': 'limits', 'mathmode': 1, 'concealchar': ' '},
  \ {'name': 'dd', 'mathmode': 1, 'concealchar': 'd'},
  \]
]])

-- =============== --
-- Markdown Config --
-- =============== --
vim.g.mkdp_auto_start = 1
vim.g.mkdp_auto_close = 1
