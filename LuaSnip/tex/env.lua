local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
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
    ),
    { condition = tex_utils.in_text }
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
        i(0),
      }
    ),
    { condition = tex_utils.in_text }
  ),
  s(
    { trig = "bp", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{homeworkProblem}[<>]
        <>
      \end{homeworkProblem}
      ]],
      {
        i(1),
        i(0),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "beg", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{<>}[<>]
        <>
      \end{<>}
      ]],
      {
        i(1),
        i(2),
        i(0),
        rep(1),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "ben", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{enumerate}[<>]
        \item <>
      \end{enumerate}
      ]],
      {
        i(1, "(a)"),
        i(0),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "framed", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{framed}
        <>
      \end{framed}
      ]],
      {
        i(0),
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "box", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{box}
        <>
      \end{box}
      ]],
      {
        i(0),
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "dcase", snippetType = "autosnippet", priority = 2000 },
    fmta(
      [[
      \begin{dcases}
        <>
      \end{dcases}
      ]],
      {
        i(0),
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "case", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{cases}
        <>
      \end{cases}
      ]],
      {
        i(0),
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "bal", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{aligned}
        <>
      \end{aligned}
      ]],
      {
        i(0),
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "bit", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{itemize}
        \item <>
      \end{itemize}
      ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),
  s({ trig = "im", snippetType = "autosnippet" }, {
    t("\\item"),
  }, { condition = line_begin }),
  s(
    { trig = "cha", snippetType = "autosnippet" },
    fmta(
      [[
        \chapter{<>}
      ]],
      {
        i(1),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "sec", snippetType = "autosnippet" },
    fmta(
      [[
        \section{<>}
      ]],
      {
        i(1),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "ssec", snippetType = "autosnippet" },
    fmta(
      [[
        \subsection{<>}
      ]],
      {
        i(1),
      }
    ),
    { condition = line_begin }
  ),
}
