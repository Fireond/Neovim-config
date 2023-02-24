local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
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
  return not tex_utils.in_mathzone
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
tex_utils.in_tikz = function()
  return tex_utils.in_env("tikzpicture")
end

local get_visual = function(args, parent)
  if #parent.snippet.env.SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else -- If SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {
  s({ trig = "vsp", snippetType = "autosnippet" }, {
    t("\\vspace{\\baselineskip}"),
  }),
  s(
    { trig = "bti", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{tikzpicture}[<>]
        <>
      \end{tikzpicture}
      ]],
      {
        i(1, "overlay,remember picture,>=stealth,nodes={align=left,inner ysep=1pt},<-"),
        i(0),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "tm", snippetType = "autosnippet" },
    fmta(
      [[
      \tikzmarknode{<>}{<>}
      ]],
      {
        i(1, "markname"),
        i(2),
      }
    ),
    { condition = tex_utils.in_tikz }
  ),
  s(
    { trig = "tm", snippetType = "autosnippet", priority = 2000 },
    fmta(
      [[
      \tikzmarknode{<>}{<>}
      ]],
      {
        i(1, "markname"),
        d(2, get_visual),
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "lu", snippetType = "autosnippet", dscr = "Left up annotate" },
    fmta(
      [[
      \path (<>.north) ++ (0,1em) node[anchor=south east,color=<>!67] (<>node){<>};
      \draw [color=<>!57](<>.north) |- ([xshift=-0.3ex,color=<>]<>node.south west);
      ]],
      {
        i(1, "markname"),
        i(2, "color"),
        rep(1),
        i(0, "text"),
        rep(2),
        rep(1),
        rep(2),
        rep(1),
      }
    ),
    { condition = tex_utils.in_tikz }
  ),
  s(
    { trig = "rd", snippetType = "autosnippet", dscr = "Right down annotate" },
    fmta(
      [[
      \path (<>.south) ++ (0,-0.8em) node[anchor=north west,color=<>!67] (<>node){<>};
      \draw [color=<>!57](<>.south) |- ([xshift=-0.3ex,color=<>]<>node.south east);
      ]],
      {
        i(1, "markname"),
        i(2, "color"),
        rep(1),
        i(0, "text"),
        rep(2),
        rep(1),
        rep(2),
        rep(1),
      }
    ),
    { condition = tex_utils.in_tikz }
  ),
  s(
    { trig = "ld", snippetType = "autosnippet", dscr = "Left down annotate" },
    fmta(
      [[
      \path (<>.south) ++ (0,-0.8em) node[anchor=north east,color=<>!67] (<>node){<>};
      \draw [color=<>!57](<>.south) |- ([xshift=-0.3ex,color=<>]<>node.south west);
      ]],
      {
        i(1, "markname"),
        i(2, "color"),
        rep(1),
        i(0, "text"),
        rep(2),
        rep(1),
        rep(2),
        rep(1),
      }
    ),
    { condition = tex_utils.in_tikz }
  ),
  s(
    { trig = "hl", snippetType = "autosnippet" },
    fmta(
      [[
      \hlmath{<>}{<>}
      ]],
      {
        i(1, "red"),
        i(2),
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "hl", snippetType = "autosnippet", priority = 2000 },
    fmta(
      [[
      \hlmath{<>}{<>}
      ]],
      {
        i(1, "red"),
        d(2, get_visual),
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "hl", snippetType = "autosnippet" },
    fmta(
      [[
      \hltext{<>}{<>}
      ]],
      {
        i(1, "red"),
        i(2),
      }
    ),
    { condition = tex_utils.in_text() }
  ),
  s(
    { trig = "hl", snippetType = "autosnippet", priority = 2000 },
    fmta(
      [[
      \hltext{<>}{<>}
      ]],
      {
        i(1, "red"),
        d(2, get_visual),
      }
    ),
    { condition = tex_utils.in_text() }
  ),
}
