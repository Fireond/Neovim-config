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
  s({ trig = "sin", snippetType = "autosnippet" }, {
    t("\\sin"),
  }),
  s({ trig = "asin", snippetType = "autosnippet" }, {
    t("\\arcsin"),
  }),
  s({ trig = "cos", snippetType = "autosnippet" }, {
    t("\\cos"),
  }),
  s({ trig = "acos", snippetType = "autosnippet" }, {
    t("\\arccos"),
  }),
  s({ trig = "tan", snippetType = "autosnippet" }, {
    t("\\tan"),
  }),
  s({ trig = "atan", snippetType = "autosnippet" }, {
    t("\\arctan"),
  }),
  s({ trig = "cot", snippetType = "autosnippet" }, {
    t("\\cot"),
  }),
  s({ trig = "acot", snippetType = "autosnippet" }, {
    t("\\arccot"),
  }),
  s({ trig = "csc", snippetType = "autosnippet" }, {
    t("\\csc"),
  }),
  s({ trig = "acsc", snippetType = "autosnippet" }, {
    t("\\arccsc"),
  }),
  s({ trig = "sec", snippetType = "autosnippet" }, {
    t("\\sec"),
  }),
  s({ trig = "asec", snippetType = "autosnippet" }, {
    t("\\arcsec"),
  }),
  s({ trig = "min", snippetType = "autosnippet" }, {
    t("\\min"),
  }),
  s({ trig = "max", snippetType = "autosnippet" }, {
    t("\\max"),
  }),
  s({ trig = "log", snippetType = "autosnippet" }, {
    t("\\mathrm{log}"),
  }),
  s({ trig = "exp", snippetType = "autosnippet" }, {
    t("\\mathrm{exp}"),
  }),
  s({ trig = "grad", snippetType = "autosnippet" }, {
    t("\\nabla"),
  }),
  s({ trig = "curl", snippetType = "autosnippet" }, {
    t("\\nabla\\times"),
  }),
  s({ trig = "div", snippetType = "autosnippet" }, {
    t("\\nabla\\cdot"),
  }),
  s({ trig = "lap", snippetType = "autosnippet" }, {
    t("\\nabla^2"),
  }),
  s({ trig = "bbr", snippetType = "autosnippet" }, {
    t("\\mathbb{R}"),
  }),
  s({ trig = "bbq", snippetType = "autosnippet" }, {
    t("\\mathbb{Q}"),
  }),
  s({ trig = "bbh", snippetType = "autosnippet" }, {
    t("\\mathbb{H}"),
  }),
  s({ trig = "bbc", snippetType = "autosnippet" }, {
    t("\\mathbb{C}"),
  }),
  s(
    { trig = "td", snippetType = "autosnippet", priority = 2000 },
    fmta("\\tilde{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "td", snippetType = "autosnippet" },
    fmta("\\ttlde{<>}", {
      i(1),
    })
  ),
  s(
    { trig = "dot", snippetType = "autosnippet", priority = 2000 },
    fmta("\\dot{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "dot", snippetType = "autosnippet" },
    fmta("\\dot{<>}", {
      i(1),
    })
  ),
  s(
    { trig = "vb", snippetType = "autosnippet", priority = 2000 },
    fmta("\\mathbf{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "vb", snippetType = "autosnippet" },
    fmta("\\mathbf{<>}", {
      i(1),
    })
  ),
  s(
    { trig = "ivb", snippetType = "autosnippet", priority = 2000 },
    fmta("\\boldsymbol{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "ivb", snippetType = "autosnippet" },
    fmta("\\boldsymbol{<>}", {
      i(1),
    })
  ),
  s(
    { trig = ";at", snippetType = "autosnippet", priority = 2000 },
    fmta("\\hat{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = ";at", snippetType = "autosnippet" },
    fmta("\\hat{<>}", {
      i(1),
    })
  ),
  s(
    { trig = ";ec", snippetType = "autosnippet", priority = 2000 },
    fmta("\\vec{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = ";ec", snippetType = "autosnippet" },
    fmta("\\vec{<>}", {
      i(1),
    })
  ),
  s(
    { trig = "msf", snippetType = "autosnippet", priority = 2000 },
    fmta("\\mathsf{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "msf", snippetType = "autosnippet" },
    fmta("\\mathsf{<>}", {
      i(1),
    })
  ),
  s(
    { trig = "cal", snippetType = "autosnippet", priority = 2000 },
    fmta("\\mathcal{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "cal", snippetType = "autosnippet" },
    fmta("\\mathcal{<>}", {
      i(1),
    })
  ),
  s(
    { trig = "scr", snippetType = "autosnippet", priority = 2000 },
    fmta("\\mathscr{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "scr", snippetType = "autosnippet" },
    fmta("\\mathscr{<>}", {
      i(1),
    })
  ),
  s(
    { trig = "mbb", snippetType = "autosnippet", priority = 2000 },
    fmta("\\mathbb{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "mbb", snippetType = "autosnippet" },
    fmta("\\mathbb{<>}", {
      i(1),
    })
  ),
  s(
    { trig = "mrm", snippetType = "autosnippet", priority = 2000 },
    fmta("\\mathrm{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "mrm", snippetType = "autosnippet" },
    fmta("\\mathrm{<>}", {
      i(1),
    })
  ),
  s(
    { trig = "qb", snippetType = "autosnippet", priority = 2000 },
    fmta("\\left(<>\\right)", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "qb", snippetType = "autosnippet" },
    fmta("\\left(<>\\right)", {
      i(1),
    })
  ),
  s(
    { trig = "qB", snippetType = "autosnippet", priority = 2000 },
    fmta("\\left{<>\\right}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "qB", snippetType = "autosnippet" },
    fmta("\\left{<>\\right}", {
      i(1),
    })
  ),
  s(
    { trig = "q[]", snippetType = "autosnippet", priority = 2000 },
    fmta("\\left[<>\\right]", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "q[", snippetType = "autosnippet" },
    fmta("\\left[<>\\right]", {
      i(1),
    })
  ),
  s(
    { trig = ";orm", snippetType = "autosnippet", priority = 2000 },
    fmta("\\left|\\left|<>\\right|\\right|", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = ";orm", snippetType = "autosnippet" },
    fmta("\\left|\\left|<>\\right|\\right|", {
      i(1),
    })
  ),
  s(
    { trig = ";bs", snippetType = "autosnippet", priority = 2000 },
    fmta("\\left|<>\\right|", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "abs", snippetType = "autosnippet" },
    fmta("\\left|<>\\right|", {
      i(1),
    })
  ),
  s(
    { trig = ";an", snippetType = "autosnippet" },
    fmta("\\mathrm{rank}{<>}", {
      i(1),
    })
  ),
  s(
    { trig = ";et", snippetType = "autosnippet" },
    fmta("\\mathrm{det}{<>}", {
      i(1),
    })
  ),
}
