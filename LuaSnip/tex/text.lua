local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local tex_utils = {}
tex_utils.in_mathzone = function() -- math context detection
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex_utils.in_text = function()
  return not tex_utils.in_mathzone()
end

return {
  s({ trig = "%%", snippetType = "autosnippet" }, {
    t("\\%"),
  }, { condition = tex_utils.in_text }),
  s({ trig = "&&", snippetType = "autosnippet" }, {
    t("\\&"),
  }, { condition = tex_utils.in_text }),
}
