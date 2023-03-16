return {
  {
    "ziontee113/neo-minimap",
    config = function()
      require("neo-minimap").set({ "<leader>lc", "<leader>lb" }, "*.tex", {
        events = { "BufEnter" },
        query = {},
        regex = {
          { [[\\chapter]], [[\\section]], [[\\subsection]], [[\\subsubsection]] },
          { [[\\begin{.*}]] },
        },
      })
    end,
    ft = "tex",
    -- keys = {
    --   { "<leader>lb", desc = "Latex begins" },
    --   { "<leader>lc", desc = "Latex parts" },
    -- },
  },
}
