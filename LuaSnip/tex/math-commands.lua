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
  s({ trig = "sin", snippetType = "autosnippet" }, {
    t("\\sin"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "asin", snippetType = "autosnippet" }, {
    t("\\arcsin"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "cos", snippetType = "autosnippet" }, {
    t("\\cos"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "acos", snippetType = "autosnippet" }, {
    t("\\arccos"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "tan", snippetType = "autosnippet" }, {
    t("\\tan"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "atan", snippetType = "autosnippet" }, {
    t("\\arctan"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "cot", snippetType = "autosnippet" }, {
    t("\\cot"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "acot", snippetType = "autosnippet" }, {
    t("\\arccot"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "csc", snippetType = "autosnippet" }, {
    t("\\csc"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "acsc", snippetType = "autosnippet" }, {
    t("\\arccsc"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "sec", snippetType = "autosnippet" }, {
    t("\\sec"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "asec", snippetType = "autosnippet" }, {
    t("\\arcsec"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "min", snippetType = "autosnippet" }, {
    t("\\min"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "max", snippetType = "autosnippet" }, {
    t("\\max"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "log", snippetType = "autosnippet" }, {
    t("\\log"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "exp", snippetType = "autosnippet" }, {
    t("\\exp"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "grad", snippetType = "autosnippet" }, {
    t("\\grad"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "curl", snippetType = "autosnippet" }, {
    t("\\curl"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "div", snippetType = "autosnippet" }, {
    t("\\div"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "lap", snippetType = "autosnippet" }, {
    t("\\laplacian"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "bbr", snippetType = "autosnippet" }, {
    t("\\mathbb{R}"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "bbq", snippetType = "autosnippet" }, {
    t("\\mathbb{Q}"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "bbh", snippetType = "autosnippet" }, {
    t("\\mathbb{H}"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "bbc", snippetType = "autosnippet" }, {
    t("\\mathbb{C}"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "bbz", snippetType = "autosnippet" }, {
    t("\\mathbb{Z}"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "bbn", snippetType = "autosnippet" }, {
    t("\\mathbb{N}"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "bb1", snippetType = "autosnippet" }, {
    t("\\mathbbm{1}"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "bbe", snippetType = "autosnippet" }, {
    t("\\mathbb{E}"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "exp", snippetType = "autosnippet" }, {
    t("\\exp"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "exp", snippetType = "autosnippet" }, {
    t("\\exp"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "exp", snippetType = "autosnippet" }, {
    t("\\exp"),
  }, { condition = tex_utils.in_mathzone }),
  s(
    { trig = "bar", snippetType = "autosnippet", priority = 2000 },
    fmta("\\overline{<>}", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "bar", snippetType = "autosnippet" },
    fmta("\\overline{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "td", snippetType = "autosnippet", priority = 2000 },
    fmta("\\tilde{<>}", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "td", snippetType = "autosnippet" },
    fmta("\\ttlde{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "dot", snippetType = "autosnippet", priority = 2000 },
    fmta("\\dot{<>}", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "dot", snippetType = "autosnippet" },
    fmta("\\dot{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "vb", snippetType = "autosnippet", priority = 2000 },
    fmta("\\vb{<>}", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "vb", snippetType = "autosnippet" },
    fmta("\\vb{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "iv", snippetType = "autosnippet", wordTrig = false, priority = 2000 },
    fmta("\\ivb{<>}", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "ivb", snippetType = "autosnippet" },
    fmta("\\vb*{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "hat", snippetType = "autosnippet", priority = 2000 },
    fmta("\\hat{<>}", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "hat", snippetType = "autosnippet" },
    fmta("\\hat{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "vec", snippetType = "autosnippet", priority = 2000 },
    fmta("\\vec{<>}", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "vec", snippetType = "autosnippet" },
    fmta("\\vec{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "msf", snippetType = "autosnippet", priority = 2000 },
    fmta("\\mathsf{<>}", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "msf", snippetType = "autosnippet" },
    fmta("\\mathsf{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "cal", snippetType = "autosnippet", priority = 2000 },
    fmta("\\mathcal{<>}", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "cal", snippetType = "autosnippet" },
    fmta("\\mathcal{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "scr", snippetType = "autosnippet", priority = 2000 },
    fmta("\\mathscr{<>}", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "scr", snippetType = "autosnippet" },
    fmta("\\mathscr{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "mbb", snippetType = "autosnippet", priority = 2000 },
    fmta("\\mathbb{<>}", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "mbb", snippetType = "autosnippet" },
    fmta("\\mathbb{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "mrm", snippetType = "autosnippet", priority = 2000 },
    fmta("\\mathrm{<>}", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "mrm", snippetType = "autosnippet" },
    fmta("\\mathrm{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "qb", snippetType = "autosnippet", priority = 2000 },
    fmta("\\qty(<>)", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "qb", snippetType = "autosnippet" },
    fmta("\\qty(<>)", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "mb", snippetType = "autosnippet" },
    fmta("\\mqty(<>)", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "qB", snippetType = "autosnippet", priority = 2000 },
    fmta("\\qty{<>}", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "qB", snippetType = "autosnippet" },
    fmta("\\qty{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "q[]", snippetType = "autosnippet", priority = 2000 },
    fmta("\\qty[<>", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "q[", snippetType = "autosnippet" },
    fmta("\\qty[<>", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "m[", snippetType = "autosnippet" },
    fmta("\\mqty[<>", {
      i(0),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "ket", snippetType = "autosnippet", priority = 2000 },
    fmta("\\ket{<>}", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "ket", snippetType = "autosnippet" },
    fmta("\\ket{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "bra", snippetType = "autosnippet", priority = 2000 },
    fmta("\\bra{<>}", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "bra", snippetType = "autosnippet" },
    fmta("\\bra{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "norm", snippetType = "autosnippet", priority = 2000 },
    fmta("\\norm{<>}", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "norm", snippetType = "autosnippet" },
    fmta("\\norm{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "abs", snippetType = "autosnippet", priority = 2000 },
    fmta("\\abs{<>}", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "abs", snippetType = "autosnippet" },
    fmta("\\abs{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "norm", snippetType = "autosnippet", priority = 2000 },
    fmta("\\norm{<>}", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "norm", snippetType = "autosnippet" },
    fmta("\\norm{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "bk", snippetType = "autosnippet" },
    fmta("\\ip{<>}{<>}", {
      i(1),
      i(2),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "kb", snippetType = "autosnippet" },
    fmta("\\op{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "ev", snippetType = "autosnippet" },
    fmta("\\ev{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "mev", snippetType = "autosnippet" },
    fmta("\\ev{<>}{<>}", {
      i(1),
      i(2),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "mel", snippetType = "autosnippet" },
    fmta("\\mel{<>}{<>}{<>}", {
      i(1),
      i(2),
      i(3),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "rr", snippetType = "autosnippet" },
    fmta("\\Ran(<>)", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "kk", snippetType = "autosnippet" },
    fmta("\\Ker(<>)", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "rank", snippetType = "autosnippet" },
    fmta("\\rank(<>)", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "dim", snippetType = "autosnippet" }, fmta("\\dim", {}), { condition = tex_utils.in_mathzone }),
  s(
    { trig = "det", snippetType = "autosnippet" },
    fmta("\\det(<>)", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "ja", snippetType = "autosnippet" },
    fmta("\\langle <> \\rangle", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = ";r", snippetType = "autosnippet" },
    fmta("\\frac{<>}{<>}", {
      i(1),
      i(2),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = ";r", snippetType = "autosnippet", priority = 2000 },
    fmta("\\frac{<>}{<>}", {
      d(1, get_visual),
      i(2),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "bi", snippetType = "autosnippet" },
    fmta("\\binom{<>}{<>}", {
      i(1),
      i(2),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "dd", snippetType = "autosnippet" },
    fmta("\\dd{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "sq", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\sqrt{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "pp", snippetType = "autosnippet" },
    fmta(
      [[
    \begin{pmatrix}
    1 & <> & <>\\
    0 & 1 & <>\\
    0 & 0 & 1\\
    \end{pmatrix}
    ]],
      {
        i(1),
        i(2),
        i(3),
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
}
