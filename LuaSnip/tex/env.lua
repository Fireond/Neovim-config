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
    { trig = "ii", snippetType = "autosnippet" },
    fmta(
      [[
      \(<>\)
      ]],
      {
        i(1),
      }
    )
  ),
  s(
    { trig = "dd", snippetType = "autosnippet" },
    fmta(
      [[
      \[
        <>
      .\]
      ]],
      {
        i(1),
      }
    )
  ),
  s(
    { trig = "tit", snippetType = "autosnippet", priority = 2000 },
    fmta("\\textit{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "tit", snippetType = "autosnippet" },
    fmta("\\textit{<>}", {
      i(1),
    })
  ),
  s(
    { trig = "tbf", snippetType = "autosnippet", priority = 2000 },
    fmta("\\textbf{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "tbf", snippetType = "autosnippet" },
    fmta("\\textbf{<>}", {
      i(1),
    })
  ),
  s(
    { trig = "tet", snippetType = "autosnippet", priority = 2000 },
    fmta("\\text{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "tet", snippetType = "autosnippet" },
    fmta("\\text{<>}", {
      i(1),
    })
  ),
  s(
    { trig = "beg", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{<>}{<>}{<>}
        <>
      \end{<>}
      ]],
      {
        i(1),
        i(2),
        rep(2),
        i(3),
        rep(1), -- this node repeats insert node i(1)
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "fram" },
    fmta(
      [[
      \begin{framed}
        <>
      \end{framed}
      ]],
      {
        i(1),
      }
    ),
    { condition = tex_utils.in_text() }
  ),
  s(
    { trig = "box" },
    fmta(
      [[
      \begin{box}
        <>
      \end{box}
      ]],
      {
        i(1),
      }
    ),
    { condition = tex_utils.in_text() }
  ),
  s(
    { trig = "dcase" },
    fmta(
      [[
      \begin{dcase}
        <>
      \end{dcase}
      ]],
      {
        i(1),
      }
    ),
    { condition = tex_utils.in_text() }
  ),
  s(
    { trig = "case" },
    fmta(
      [[
      \begin{case}
        <>
      \end{case}
      ]],
      {
        i(1),
      }
    ),
    { condition = tex_utils.in_text() }
  ),
  s(
    { trig = "bal" },
    fmta(
      [[
      \begin{aligned}
        <>
      \end{aligned}
      ]],
      {
        i(1),
      }
    ),
    { condition = tex_utils.in_text() }
  ),
}
