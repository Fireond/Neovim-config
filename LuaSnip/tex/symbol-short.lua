local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin

local tex_utils = {}
tex_utils.in_mathzone = function() -- math context detection
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex_utils.in_text = function()
  return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function() -- comment detection
  return vim.fn["vimtex#syntax#in_comment"]() == 1
end
tex_utils.in_env = function(name) -- generic environment detection
  local is_inside = vim.fn["vimtex#env#is_inside"](name)
  return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function() -- equation environment detection
  return tex_utils.in_env("equation")
end
tex_utils.in_itemize = function() -- itemize environment detection
  return tex_utils.in_env("itemize")
end

local get_visual = function(args, parent)
  if #parent.snippet.env.SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else -- If SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {
  s({ trig = "...", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\dots"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "c.", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\cdot"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "\\cdot.", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\cdots"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "v.", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\vdot"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "\\vdot.", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\vdots"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "iff", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\iff"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "inn", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\in"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "notin", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\not\\in"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "aa", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\forall"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "ee", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\exits"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "!=", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\neq"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "==", wordTrig = false, snippetType = "autosnippet" }, {
    t("&="),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "~=", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\approx"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "~~", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\sim"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = ">=", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\geq"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "<=", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\leq"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = ">>", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\gg"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "<<", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\ll"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "cp", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\cp"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "get", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\get"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "to", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\to"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "mto", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\mapsto"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "\\\\\\", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\setminus"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "||", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\mid"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "sr", wordTrig = false, wordTrig = false, snippetType = "autosnippet" }, {
    t("^2"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "cb", wordTrig = false, snippetType = "autosnippet" }, {
    t("^3"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "inv", wordTrig = false, snippetType = "autosnippet" }, {
    t("^{-1}"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "**", wordTrig = false, snippetType = "autosnippet" }, {
    t("^*"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "  ", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\,"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "<>", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\diamond"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "+-", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\pm"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "-+", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\mp"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "rhs", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\mathrm{R.H.S}"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "lhs", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\mathrm{L.H.S}"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "cap", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\cap"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "cup", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\cup"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "sub", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\subseteq"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "sup", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\supseteq"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "oo", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\infty"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "tp", wordTrig = false, snippetType = "autosnippet" }, {
    t("^\\top"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "dr", wordTrig = false, snippetType = "autosnippet" }, {
    t("^\\dagger"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "perp", wordTrig = false, snippetType = "autosnippet" }, {
    t("^\\perp"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "ss", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\star"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "xx", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\times"),
  }, { condition = tex_utils.in_mathzone }),
  s(
    { trig = ";j", wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[
    _{<>}
    ]],
      { i(1) }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = ";k", wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[
    ^{<>}
    ]],
      { i(1) }
    ),
    { condition = tex_utils.in_mathzone }
  ),
}
