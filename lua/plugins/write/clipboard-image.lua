return {
  {
    "ekickx/clipboard-image.nvim",
    opts = {
      default = {
        affix = "\\begin{figure}[!htb]\n\t\\centering\n\t\\includegraphics[width = 0.7\\textwidth]{~/%s}\n\t\\caption{}\n\t\\label{}\n\\end{figure}",
      },
    },
    ft = { "tex", "markdown" },
    keys = {
      { "<leader>i", "<cmd>PasteImg<cr>", desc = "Paste image" },
    },
  },
}
