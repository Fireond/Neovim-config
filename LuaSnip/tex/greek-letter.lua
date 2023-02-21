local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local tex_utils = {}
tex_utils.in_mathzone = function() -- math context detection
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex_utils.in_text = function()
  return not tex_utils.in_mathzone()
end

return {
  s({ trig = "alp", snippetType = "autosnippet" }, {
    t("\\alpha"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Alp", snippetType = "autosnippet" }, {
    t("\\Alpha"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "beta", snippetType = "autosnippet" }, {
    t("\\beta"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Beta", snippetType = "autosnippet" }, {
    t("\\Beta"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "gam", snippetType = "autosnippet" }, {
    t("\\gamma"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Gam", snippetType = "autosnippet" }, {
    t("\\Gamma"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "del", snippetType = "autosnippet" }, {
    t("\\delta"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Del", snippetType = "autosnippet" }, {
    t("\\Delta"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "eps", snippetType = "autosnippet" }, {
    t("\\epsilon"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Eps", snippetType = "autosnippet" }, {
    t("\\Epsilon"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "zeta", snippetType = "autosnippet" }, {
    t("\\zeta"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Zeta", snippetType = "autosnippet" }, {
    t("\\Zeta"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "eta", snippetType = "autosnippet" }, {
    t("\\eta"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Eta", snippetType = "autosnippet" }, {
    t("\\Eta"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "the", snippetType = "autosnippet" }, {
    t("\\theta"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "The", snippetType = "autosnippet" }, {
    t("\\Theta"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "iot", snippetType = "autosnippet" }, {
    t("\\iota"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Iot", snippetType = "autosnippet" }, {
    t("\\Iota"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "kap", snippetType = "autosnippet" }, {
    t("\\kappa"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Kap", snippetType = "autosnippet" }, {
    t("\\Kappa"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "lam", snippetType = "autosnippet" }, {
    t("\\lambda"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Lam", snippetType = "autosnippet" }, {
    t("\\Lambda"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "mu", snippetType = "autosnippet" }, {
    t("\\mu"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Mu", snippetType = "autosnippet" }, {
    t("\\Mu"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "nu", snippetType = "autosnippet" }, {
    t("\\nu"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Nu", snippetType = "autosnippet" }, {
    t("\\Nu"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "xi", snippetType = "autosnippet" }, {
    t("\\xi"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Xi", snippetType = "autosnippet" }, {
    t("\\Xi"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "omi", snippetType = "autosnippet" }, {
    t("\\omicron"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "pi", snippetType = "autosnippet" }, {
    t("\\pi"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Pi", snippetType = "autosnippet" }, {
    t("\\Pi"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "rho", snippetType = "autosnippet" }, {
    t("\\rho"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Rho", snippetType = "autosnippet" }, {
    t("\\Rho"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "sig", snippetType = "autosnippet" }, {
    t("\\sigma"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Sig", snippetType = "autosnippet" }, {
    t("\\Sigma"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "tau", snippetType = "autosnippet" }, {
    t("\\tau"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Tau", snippetType = "autosnippet" }, {
    t("\\Tau"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "ups", snippetType = "autosnippet" }, {
    t("\\ups"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Ups", snippetType = "autosnippet" }, {
    t("\\Ups"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "phi", snippetType = "autosnippet" }, {
    t("\\phi"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Phi", snippetType = "autosnippet" }, {
    t("\\Phi"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "vhi", snippetType = "autosnippet" }, {
    t("\\varphi"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Vhi", snippetType = "autosnippet" }, {
    t("\\Varphi"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "chi", snippetType = "autosnippet" }, {
    t("\\chi"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Chi", snippetType = "autosnippet" }, {
    t("\\Chi"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "psi", snippetType = "autosnippet" }, {
    t("\\psi"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Psi", snippetType = "autosnippet" }, {
    t("\\Psi"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "ome", snippetType = "autosnippet" }, {
    t("\\omega"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Ome", snippetType = "autosnippet" }, {
    t("\\Omega"),
  }, { condition = tex_utils.in_mathzone }),
}
