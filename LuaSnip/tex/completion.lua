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
    { trig = "([%a%)%]%}])(%d)", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>_{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      f(function(_, snip)
        return snip.captures[2]
      end),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "([%a%)%]%}])_%{(%d)%}(%d)", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>_{<><>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      f(function(_, snip)
        return snip.captures[2]
      end),
      f(function(_, snip)
        return snip.captures[3]
      end),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "([%a%)%]%}])(%a)%2", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100 },
    fmta("<>_{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      f(function(_, snip)
        return snip.captures[2]
      end),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "(%a)/", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100 },
    fmta("\\frac{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "%((.)%)/", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("\\frac{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "(\\%a+)/", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 2000 },
    fmta("\\frac{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "(\\%a+%{%a+%})/", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 3000 },
    fmta("\\frac{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "\\%)(%a)", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 2000 },
    fmta("\\) <>", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "sum", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("\\sum\\limits_{<>}^{<>}", {
      i(1, "\\n = 0"),
      i(2, "\\infty"),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "prod", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("\\prod\\limits_{<>}^{<>}", {
      i(1),
      i(2),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "bcap", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("\\bigcap\\limits_{<>}^{<>}", {
      i(1),
      i(2),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "bcup", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("\\bigcup\\limits_{<>}^{<>}", {
      i(1),
      i(2),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "int", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("\\int\\limits_{<>}^{<>}<> \\dd{<>}", {
      i(1, "-\\infty"),
      i(2, "\\infty"),
      i(3),
      i(4, "x"),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "iint", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("\\iint\\limits_{<>}^{<>}<> \\dd{<>}", {
      i(1, "-\\infty"),
      i(2, "\\infty"),
      i(3),
      i(4),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "lint", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("\\iint\\limits_{<>}<> \\dd{<>}", {
      i(1, "\\infty"),
      i(2),
      i(3),
    }),
    { condition = tex_utils.in_mathzone }
  ),
}