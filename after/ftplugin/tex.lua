vim.opt.conceallevel = 2

vim.keymap.set({ "n", "i" }, "<a-f>", "<cmd>TexlabForward<cr>", { desc = "Forward search" })
vim.keymap.set({ "n", "i" }, "<a-b>", function()
  require("util.latex").format()
end, { desc = "Build" })
