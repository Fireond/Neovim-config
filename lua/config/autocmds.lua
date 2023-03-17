-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Returning focus to Neovim after inverse search
-- vim.cmd([[
-- function! s:TexFocusVim() abort
--   " Replace `TERMINAL` with the name of your terminal application
--   " Example: execute "!open -a iTerm"
--   " Example: execute "!open -a Alacritty"
--   silent execute "!open -a Alacritty"
--   redraw!
-- endfunction
-- augroup vimtex_event_focus
--   au!
--   au User VimtexEventViewReverse call s:TexFocusVim()
-- augroup END
-- ]])
-- vim.cmd([[
-- function! s:TexFocusVim() abort
--   " Replace `TERMINAL` with the name of your terminal application
--   " Example: execute "!open -a iTerm"
--   " Example: execute "!open -a Alacritty"
--   silent execute "!open -a kitty"
--   redraw!
-- endfunction
-- augroup vimtex_event_focus
--   au!
--   au User VimtexEventViewReverse call s:TexFocusVim()
-- augroup END
-- ]])

local autocmd = vim.api.nvim_create_autocmd

-- Don't auto commenting new lines
autocmd("BufEnter", {
  pattern = "",
  command = "set fo-=c fo-=r fo-=o",
})
