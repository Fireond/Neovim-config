local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local i = ls.insert_node
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
    { trig = "msf", snippetType = "autosnippet", priority = 2000 },
    fmta("\\mathsf{<>}", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = "msf", snippetType = "autosnippet" },
    fmta("\\mathsf{<>}", {
      i(0),
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
      i(0),
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
      i(0),
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
      i(0),
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
      i(0),
    }),
    { condition = tex_utils.in_mathzone }
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
      i(0),
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
      i(0),
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
      i(0),
    })
  ),
}
