return {
  {
    "frabjous/knap",
    keys = {
      {
        "<leader>pk",
        function()
          require("knap").toggle_autopreviewing()
        end,
        desc = "Knap toggle auto previewing",
      },
      {
        "<leader>pf",
        function()
          require("knap").forward_jump()
        end,
        desc = "Knap forward jump",
      },
    },
    ft = { "tex", "markdown" },
  },
}
