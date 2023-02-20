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
      $<>$
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
      $$
      <>
      .$$
      ]],
      {
        i(1),
      }
    )
  ),
  s(
    { trig = ";i", snippetType = "autosnippet", priority = 2000 },
    fmta("*<>*", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = ";i", snippetType = "autosnippet" },
    fmta("*<>*", {
      i(1),
    })
  ),
  s(
    { trig = ";b", snippetType = "autosnippet", priority = 2000 },
    fmta("**<>**", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = ";b", snippetType = "autosnippet" },
    fmta("**<>**", {
      i(1),
    })
  ),
}
