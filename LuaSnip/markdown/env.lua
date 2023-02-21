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
    { trig = ";it", snippetType = "autosnippet", priority = 2000 },
    fmta("*<>*", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = ";it", snippetType = "autosnippet" },
    fmta("*<>*", {
      i(1),
    })
  ),
  s(
    { trig = ";bo", snippetType = "autosnippet", priority = 2000 },
    fmta("**<>**", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = ";bo", snippetType = "autosnippet" },
    fmta("**<>**", {
      i(1),
    })
  ),
  s(
    { trig = "bd", snippetType = "autosnippet" },
    fmta(
      [[
      **Def.** (<>)
        <>
      ]],
      {
        i(1),
        i(2),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "bp", snippetType = "autosnippet" },
    fmta(
      [[
      **Prop.** (<>)
        <>
      ]],
      {
        i(1),
        i(2),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "bt", snippetType = "autosnippet" },
    fmta(
      [[
      **Thm.** (<>)
        <>
      ]],
      {
        i(1),
        i(2),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "br", snippetType = "autosnippet" },
    fmta(
      [[
      **Proof.** (<>)
        <>
      ]],
      {
        i(1),
        i(2),
      }
    ),
    { condition = line_begin }
  ),
}
