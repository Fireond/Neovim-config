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
    { trig = "qp", snippetType = "autosnippet", priority = 2000 },
    fmta("\\qty[<>]", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "qp", snippetType = "autosnippet" },
    fmta("\\qty[<>]", {
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
    { trig = "mB", snippetType = "autosnippet" },
    fmta("\\mqty{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "mp", snippetType = "autosnippet" },
    fmta("\\mqty[<>]", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "im", snippetType = "autosnippet" },
    fmta("\\imat{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "xm", snippetType = "autosnippet" },
    fmta("\\xmat{<>}{<>}{<>}", {
      i(1),
      i(2),
      i(3),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "zm", snippetType = "autosnippet" },
    fmta("\\zmat{<>}{<>}", {
      i(1),
      i(2),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "pm", snippetType = "autosnippet" },
    fmta("\\pmat{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "dm", snippetType = "autosnippet" },
    fmta("\\dmat{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "adm", snippetType = "autosnippet" },
    fmta("\\admat{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "comm", snippetType = "autosnippet" },
    fmta("\\comm{<>}{<>}", {
      i(1),
      i(2),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "acom", snippetType = "autosnippet" },
    fmta("\\acomm{<>}{<>}", {
      i(1),
      i(2),
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
    { trig = "mdet", snippetType = "autosnippet" },
    fmta("\\mdet{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "pr", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\Pr{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "ord", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\order{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "qif", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\qif", {}),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "qq", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\qq{<>}", {
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "qor", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\qor", {}),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "qif", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\qif", {}),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "dv", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\dv[<>]{<>}{<>}", {
      i(1),
      i(2),
      i(3),
    }),
    { condition = tex_utils.in_mathzone }
  ),
}