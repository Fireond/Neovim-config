return {
  {
    "luk400/vim-jukit",
    keys = {
      { "<leader>ln", "<cmd>call jukit#splits#output()<cr>", desc = "Open output window" },
      { "<leader>lN", "<cmd>call jukit#splits#close_output_split()<cr>", desc = "Close output window" },
      { "<leader>ls", "<cmd>call jukit#send#section(0)<cr>", desc = "Send current code" },
      { "<leader>ll", "<cmd>call jukit#send#line()<cr>", desc = "Send current line" },
      { "<leader>ls", "<cmd><c-u>call jukit#send#selection()<cr>", desc = "Send selected code", mode = "v" },
      { "<leader>lr", "<cmd>call jukit#send#until_current_section()<cr>", desc = "Execute until current" },
      { "<leader>la", "<cmd>call jukit#send#all()<cr>", desc = "Execute all" },
      { "<leader>lo", "<cmd>call jukit#cells#create_below(0)<cr>", desc = "New code cell below" },
      { "<leader>lO", "<cmd>call jukit#cells#create_above(0)<cr>", desc = "New code cell above" },
      { "<leader>lt", "<cmd>call jukit#cells#create_below(1)<cr>", desc = "New text cell below" },
      { "<leader>lT", "<cmd>call jukit#cells#create_above(1)<cr>", desc = "New text cell above" },
      { "<leader>ld", "<cmd>call jukit#cells#delete()<cr>", desc = "Delete current cell" },
      { "<leader>lk", "<cmd>call jukit#cells#move_up()<cr>", desc = "Move current cell up" },
      { "<leader>lj", "<cmd>call jukit#cells#move_down()<cr>", desc = "Move current cell down" },
      { "<leader>lK", "<cmd>call jukit#cells#jump_to_next_cell()<cr>", desc = "Jump to next cell" },
      { "<leader>lJ", "<cmd>call jukit#cells#jump_to_previous_cell()<cr>", desc = "Jump to previous cell" },
      {
        "<leader>lp",
        '<cmd>call jukit#convert#notebook_convert("jupyter-notebook")<cr>',
        desc = "Toggle ipynb and py",
      },
      {
        "<leader>lh",
        "<cmd>call jukit#convert#save_nb_to_file(0,1,'html')<cr>",
        desc = "Convert to html",
      },
    },
    ft = "json",
  },
}
