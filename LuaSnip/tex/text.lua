local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local tex = require("utils.latex")

return {
  s({ trig = "dps", snippetType = "autosnippet" }, {
    t("\\displaystyle"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "%%", snippetType = "autosnippet" }, {
    t("\\%"),
  }, { condition = tex.in_text }),
  s({ trig = "&&", snippetType = "autosnippet" }, {
    t("\\&"),
  }, { condition = tex.in_text }),
  s({ trig = "##", snippetType = "autosnippet" }, {
    t("\\#"),
  }, { condition = tex.in_text }),
  s({ trig = "thm", snippetType = "autosnippet" }, {
    t("theorem"),
  }, { condition = tex.in_text }),
  s({ trig = "propp", snippetType = "autosnippet" }, {
    t("proposition"),
  }, { condition = tex.in_text }),
  s({ trig = "deff", snippetType = "autosnippet" }, {
    t("definition"),
  }, { condition = tex.in_text }),
  s({ trig = "exaa", snippetType = "autosnippet" }, {
    t("example"),
  }, { condition = tex.in_text }),
  s({ trig = "iee", snippetType = "autosnippet" }, {
    t("i.e."),
  }, { condition = tex.in_text }),
  s({ trig = "stt", snippetType = "autosnippet" }, {
    t("s.t."),
  }, { condition = tex.in_text }),
  s({ trig = "iso" }, {
    t("isomorphic"),
  }, { condition = tex.in_text }),
  s({ trig = "iso" }, {
    t("isomorphism"),
  }, { condition = tex.in_text }),
  s({ trig = "homo" }, {
    t("homomorphism"),
  }, { condition = tex.in_text }),
  s({ trig = "homo" }, {
    t("homomorphic"),
  }, { condition = tex.in_text }),
  s({ trig = "psp", snippetType = "autosnippet" }, {
    t("\\(p\\)-subgroup"),
  }, { condition = tex.in_text }),
  s({ trig = "pgp", snippetType = "autosnippet" }, {
    t("\\(p\\)-subgroup"),
  }, { condition = tex.in_text }),
  s({ trig = "spsp", snippetType = "autosnippet" }, {
    t("Sylow \\(p\\)-subgroup"),
  }, { condition = tex.in_text }),
  s({ trig = "=>", snippetType = "autosnippet" }, {
    t("\\(\\implies\\)"),
  }, { condition = tex.in_text }),
}
