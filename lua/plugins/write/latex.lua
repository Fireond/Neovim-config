return {
  {
    "ryleelyman/latex.nvim",
    opts = {
      conceals = {
        add = {
          ["colon"] = ":",
          ["coloneqq"] = "≔",
          ["pdv"] = "∂",
          ["odv"] = "d",
          ["|"] = "⫴",
          ["{"] = "{",
          ["}"] = "}",
          [","] = " ",

          -- hide
          [" "] = "",
          ["mathrm"] = "",
          ["displaystyle"] = "",
          ["limits"] = "",
          ["ab"] = "",
          ["bra"] = "",
          ["ket"] = "",
          ["braket"] = "",
          ["ketbra"] = "",
        },
      },
      imaps = {
        enabled = false,
        -- add = { ["\\emptyset"] = "1", ["\\Alpha"] = "A" },
        -- default_leader = ";",
      },
      surrounds = { enabled = false },
    },
    ft = "tex",
  },

  -- inverse serach for LaTeX
  {
    "f3fora/nvim-texlabconfig",
    config = true,
    build = "go build",
    ft = "tex",
  },
}
