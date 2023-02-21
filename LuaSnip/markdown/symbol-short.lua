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
  }),
  s({ trig = "c.", snippetType = "autosnippet" }, {
    t("\\cdot"),
  }),
  s({ trig = "\\cdot.", snippetType = "autosnippet" }, {
    t("\\cdots"),
  }),
  s({ trig = "v.", snippetType = "autosnippet" }, {
    t("\\vdot"),
  }),
  s({ trig = "\\vdot.", snippetType = "autosnippet" }, {
    t("\\vdots"),
  }),
  s({ trig = "iff", snippetType = "autosnippet" }, {
    t("\\iff"),
  }),
  s({ trig = "inn", snippetType = "autosnippet" }, {
    t("\\in"),
  }),
  s({ trig = "notin", snippetType = "autosnippet" }, {
    t("\\not\\inn"),
  }),
  s({ trig = "aa", snippetType = "autosnippet" }, {
    t("\\forall"),
  }),
  s({ trig = "ee", snippetType = "autosnippet" }, {
    t("\\exits"),
  }),
  s({ trig = "!=", snippetType = "autosnippet" }, {
    t("\\neq"),
  }),
  s({ trig = "==", snippetType = "autosnippet" }, {
    t("&="),
  }),
  s({ trig = "~=", snippetType = "autosnippet" }, {
    t("\\approx"),
  }),
  s({ trig = "~~", snippetType = "autosnippet" }, {
    t("\\sim"),
  }),
  s({ trig = ">=", snippetType = "autosnippet" }, {
    t("\\geq"),
  }),
  s({ trig = "<=", snippetType = "autosnippet" }, {
    t("\\leq"),
  }),
  s({ trig = ">>", snippetType = "autosnippet" }, {
    t("\\gg"),
  }),
  s({ trig = "<<", snippetType = "autosnippet" }, {
    t("\\ll"),
  }),
  s({ trig = "cp", snippetType = "autosnippet" }, {
    t("\\cp"),
  }),
  s({ trig = ";get", snippetType = "autosnippet" }, {
    t("\\get"),
  }),
  s({ trig = ";to", snippetType = "autosnippet" }, {
    t("\\to"),
  }),
  s({ trig = "mto", snippetType = "autosnippet" }, {
    t("\\mapsto"),
  }),
  s({ trig = "\\\\", snippetType = "autosnippet" }, {
    t("\\setminus"),
  }),
  s({ trig = "||", snippetType = "autosnippet" }, {
    t("\\mid"),
  }),
  s({ trig = "sr", snippetType = "autosnippet" }, {
    t("^2"),
  }),
  s({ trig = "cb", snippetType = "autosnippet" }, {
    t("^3"),
  }),
  s({ trig = ";inv", snippetType = "autosnippet" }, {
    t("^{-1}"),
  }),
  s({ trig = "**", snippetType = "autosnippet" }, {
    t("^*"),
  }),
  s({ trig = "<>", snippetType = "autosnippet" }, {
    t("\\diamond"),
  }),
  s({ trig = "+-", snippetType = "autosnippet" }, {
    t("\\pm"),
  }),
  s({ trig = "-+", snippetType = "autosnippet" }, {
    t("\\mp"),
  }),
  s({ trig = "rhs", snippetType = "autosnippet" }, {
    t("\\mathrm{R.H.S}"),
  }),
  s({ trig = "lhs", snippetType = "autosnippet" }, {
    t("\\mathrm{L.H.S}"),
  }),
  s({ trig = ";ap", snippetType = "autosnippet" }, {
    t("\\cap"),
  }),
  s({ trig = ";up", snippetType = "autosnippet" }, {
    t("\\cup"),
  }),
  s({ trig = ";ub", snippetType = "autosnippet" }, {
    t("\\subseteq"),
  }),
  s({ trig = ";up", snippetType = "autosnippet" }, {
    t("\\supseteq"),
  }),
  s({ trig = "oo", snippetType = "autosnippet" }, {
    t("\\infty"),
  }),
  s({ trig = "tp", snippetType = "autosnippet" }, {
    t("^\\top"),
  }),
  s({ trig = "dr", snippetType = "autosnippet" }, {
    t("^\\dagger"),
  }),
  s({ trig = ";erp", snippetType = "autosnippet" }, {
    t("^\\perp"),
  }),
  s({ trig = "ss", snippetType = "autosnippet" }, {
    t("^\\star"),
  }),
}
