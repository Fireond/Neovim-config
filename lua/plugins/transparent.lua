return {
  {
    "xiyaowong/nvim-transparent",
    config = {
      enable = false, -- boolean: enable transparent
      extra_groups = {
        "BufferLineTabClose",
        "BufferlineBufferSelected",
        "BufferLineFill",
        "BufferLineBackground",
        "BufferLineSeparator",
        "BufferLineIndicatorSelected",
      },
      exclude = {}, -- table: groups you don't want to clear
      ignore_linked_group = true, -- boolean: don't clear a group that links to another group
    },
  },
  {
    "rcarriga/nvim-notify",
    config = {
      background_colour = "#000000",
    },
  },
}
