return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      ---@type lspconfig.options
      servers = {
        -- texlab will be automatically installed with mason and loaded with lspconfig
        texlab = {
          settings = {
            texlab = {
              build = {
                -- executable = "pdflatex",
                -- args = {},
                onSave = true,
              },
              -- rootDirectory = "..",
              forwardSearch = {
                executable = "sioyek",
                args = {
                  "--reuse-window",
                  "--inverse-search",
                  [[nvim-texlabconfig -file %1 -line %2 -server ]] .. vim.v.servername,
                  "--forward-search-file",
                  "%f",
                  "--forward-search-line",
                  "%l",
                  "%p",
                },
              },
              diagnostics = { ignoredPatterns = { "^Overfull", "^Underfull" } },
              latexFormatter = "none",
              -- bibFormatter = "latexindent",
              -- latexindent = {
              --   ["local"] = "latexindent.yaml",
              -- },
            },
          },
        },
      },
    },
  },
}
