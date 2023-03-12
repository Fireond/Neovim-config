return {
  {
    "CRAG666/code_runner.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>rr", "<cmd>RunCode<cr>", desc = "Run Code" },
      { "<leader>rf", "<cmd>RunFile<cr>", desc = "Run File" },
      { "<leader>rp", "<cmd>RunProject<cr>", desc = "Run Project" },
      { "<leader>rd", "<cmd>RunClose<cr>", desc = "Run Close" },
    },
    ft = { "lua", "python", "c", "cpp" },
    config = {
      filetype = {
        python = "python3 -u",
      },
      mode = "toggleterm",
      float = {
        close_key = "q",
      },
    },
  },
}
