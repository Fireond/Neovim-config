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
  s({ trig = "...", snippetType = "autosnippet" }, {
    t("\\dots"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "c.", snippetType = "autosnippet" }, {
    t("\\cdot"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "\\cdot.", snippetType = "autosnippet" }, {
    t("\\cdots"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "v.", snippetType = "autosnippet" }, {
    t("\\vdot"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "\\vdot.", snippetType = "autosnippet" }, {
    t("\\vdots"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "iff", snippetType = "autosnippet" }, {
    t("\\iff"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "inn", snippetType = "autosnippet" }, {
    t("\\in"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "notin", snippetType = "autosnippet" }, {
    t("\\not\\inn"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "aa", snippetType = "autosnippet" }, {
    t("\\forall"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "ee", snippetType = "autosnippet" }, {
    t("\\exits"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "!=", snippetType = "autosnippet" }, {
    t("\\neq"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "==", snippetType = "autosnippet" }, {
    t("&="),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "~=", snippetType = "autosnippet" }, {
    t("\\approx"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "~~", snippetType = "autosnippet" }, {
    t("\\sim"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = ">=", snippetType = "autosnippet" }, {
    t("\\geq"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "<=", snippetType = "autosnippet" }, {
    t("\\leq"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = ">>", snippetType = "autosnippet" }, {
    t("\\gg"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "<<", snippetType = "autosnippet" }, {
    t("\\ll"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "cp", snippetType = "autosnippet" }, {
    t("\\cp"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "get", snippetType = "autosnippet" }, {
    t("\\get"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "to", snippetType = "autosnippet" }, {
    t("\\to"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "mto", snippetType = "autosnippet" }, {
    t("\\mapsto"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "\\\\", snippetType = "autosnippet" }, {
    t("\\setminus"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "||", snippetType = "autosnippet" }, {
    t("\\mid"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "sr", snippetType = "autosnippet" }, {
    t("^2"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "cb", snippetType = "autosnippet" }, {
    t("^3"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "inv", snippetType = "autosnippet" }, {
    t("^{-1}"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "**", snippetType = "autosnippet" }, {
    t("^*"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "  ", snippetType = "autosnippet" }, {
    t("\\,"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "<>", snippetType = "autosnippet" }, {
    t("\\diamond"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "+-", snippetType = "autosnippet" }, {
    t("\\pm"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "-+", snippetType = "autosnippet" }, {
    t("\\mp"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "rhs", snippetType = "autosnippet" }, {
    t("\\mathrm{R.H.S}"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "lhs", snippetType = "autosnippet" }, {
    t("\\mathrm{L.H.S}"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "cap", snippetType = "autosnippet" }, {
    t("\\cap"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "cup", snippetType = "autosnippet" }, {
    t("\\cup"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "sub", snippetType = "autosnippet" }, {
    t("\\subseteq"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "sup", snippetType = "autosnippet" }, {
    t("\\supseteq"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "oo", snippetType = "autosnippet" }, {
    t("\\infty"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "tp", snippetType = "autosnippet" }, {
    t("^\\top"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "dr", snippetType = "autosnippet" }, {
    t("^\\dagger"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "perp", snippetType = "autosnippet" }, {
    t("^\\perp"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "ss", snippetType = "autosnippet" }, {
    t("^\\star"),
  }, { condition = tex_utils.in_mathzone }),
}
