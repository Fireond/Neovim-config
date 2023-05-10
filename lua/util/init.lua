local M = {}

M.clean = function()
  local current_dir = vim.fn.expand("%:p:h")
  local file_types = { "aux", "log", "out", "fls", "fdb_latexmk", "gz", "bcf", "run.xml", "toc" }
  for _, file_type in ipairs(file_types) do
    local file_pattern = current_dir .. "/*." .. file_type
    local command = "silent !rm " .. file_pattern
    vim.cmd(command)
  end
end

return M
