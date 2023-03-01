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
  s({ trig = "##", snippetType = "autosnippet" }, {
    t("\\#"),
  }, { condition = tex_utils.in_text }),
  s({ trig = "thm", snippetType = "autosnippet" }, {
    t("theorem"),
  }, { condition = tex_utils.in_text }),
  s({ trig = "pron", snippetType = "autosnippet" }, {
    t("proposition"),
  }, { condition = tex_utils.in_text }),
  s({ trig = "exe", snippetType = "autosnippet" }, {
    t("example"),
  }, { condition = tex_utils.in_text }),
  s({ trig = "iee", snippetType = "autosnippet" }, {
    t("i.e."),
  }, { condition = tex_utils.in_text }),
  s({ trig = "stt", snippetType = "autosnippet" }, {
    t("s.t."),
  }, { condition = tex_utils.in_text }),
}
