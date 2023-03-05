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
  s({ trig = "alp", snippetType = "autosnippet", wordTrig = false }, {
    t("\\alpha"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Alp", snippetType = "autosnippet", wordTrig = false }, {
    t("\\Alpha"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "beta", snippetType = "autosnippet", wordTrig = false }, {
    t("\\beta"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Beta", snippetType = "autosnippet", wordTrig = false }, {
    t("\\Beta"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "gam", snippetType = "autosnippet", wordTrig = false }, {
    t("\\gamma"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Gam", snippetType = "autosnippet", wordTrig = false }, {
    t("\\Gamma"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "del", snippetType = "autosnippet", wordTrig = false }, {
    t("\\delta"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Del", snippetType = "autosnippet", wordTrig = false }, {
    t("\\Delta"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "eps", snippetType = "autosnippet", wordTrig = false }, {
    t("\\epsilon"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "vps", snippetType = "autosnippet", wordTrig = false }, {
    t("\\varepsilon"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Eps", snippetType = "autosnippet", wordTrig = false }, {
    t("\\Epsilon"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "zeta", snippetType = "autosnippet", wordTrig = false }, {
    t("\\zeta"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Zeta", snippetType = "autosnippet", wordTrig = false }, {
    t("\\Zeta"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "eta", snippetType = "autosnippet", wordTrig = false }, {
    t("\\eta"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Eta", snippetType = "autosnippet", wordTrig = false }, {
    t("\\Eta"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "the", snippetType = "autosnippet", wordTrig = false }, {
    t("\\theta"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "The", snippetType = "autosnippet", wordTrig = false }, {
    t("\\Theta"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "iot", snippetType = "autosnippet", wordTrig = false }, {
    t("\\iota"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Iot", snippetType = "autosnippet", wordTrig = false }, {
    t("\\Iota"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "kap", snippetType = "autosnippet", wordTrig = false }, {
    t("\\kappa"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Kap", snippetType = "autosnippet", wordTrig = false }, {
    t("\\Kappa"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "lam", snippetType = "autosnippet", wordTrig = false }, {
    t("\\lambda"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Lam", snippetType = "autosnippet", wordTrig = false }, {
    t("\\Lambda"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "mu", snippetType = "autosnippet", wordTrig = false }, {
    t("\\mu"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Mu", snippetType = "autosnippet", wordTrig = false }, {
    t("\\Mu"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "nu", snippetType = "autosnippet", wordTrig = false }, {
    t("\\nu"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Nu", snippetType = "autosnippet", wordTrig = false }, {
    t("\\Nu"),
  }, { condition = tex_utils.in_mathzone }),
  -- s({ trig = "xi", snippetType = "autosnippet", wordTrig = false }, {
  --   t("\\xi"),
  -- }, { condition = tex_utils.in_mathzone }),
  -- s({ trig = "Xi", snippetType = "autosnippet", wordTrig = false }, {
  --   t("\\Xi"),
  -- }, { condition = tex_utils.in_mathzone }),
  s({ trig = "omi", snippetType = "autosnippet", wordTrig = false }, {
    t("\\omicron"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "pi", snippetType = "autosnippet", wordTrig = false }, {
    t("\\pi"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Pi", snippetType = "autosnippet", wordTrig = false }, {
    t("\\Pi"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "rho", snippetType = "autosnippet", wordTrig = false }, {
    t("\\rho"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Rho", snippetType = "autosnippet", wordTrig = false }, {
    t("\\Rho"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "sig", snippetType = "autosnippet", wordTrig = false }, {
    t("\\sigma"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Sig", snippetType = "autosnippet", wordTrig = false }, {
    t("\\Sigma"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "tau", snippetType = "autosnippet", wordTrig = false }, {
    t("\\tau"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Tau", snippetType = "autosnippet", wordTrig = false }, {
    t("\\Tau"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "ups", snippetType = "autosnippet", wordTrig = false }, {
    t("\\ups"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Ups", snippetType = "autosnippet", wordTrig = false }, {
    t("\\Ups"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "phi", snippetType = "autosnippet", wordTrig = false }, {
    t("\\phi"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Phi", snippetType = "autosnippet", wordTrig = false }, {
    t("\\Phi"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "vhi", snippetType = "autosnippet", wordTrig = false }, {
    t("\\varphi"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Vhi", snippetType = "autosnippet", wordTrig = false }, {
    t("\\Varphi"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "chi", snippetType = "autosnippet", wordTrig = false }, {
    t("\\chi"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Chi", snippetType = "autosnippet", wordTrig = false }, {
    t("\\Chi"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "psi", snippetType = "autosnippet", wordTrig = false }, {
    t("\\psi"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Psi", snippetType = "autosnippet", wordTrig = false }, {
    t("\\Psi"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "ome", snippetType = "autosnippet", wordTrig = false }, {
    t("\\omega"),
  }, { condition = tex_utils.in_mathzone }),
  s({ trig = "Ome", snippetType = "autosnippet", wordTrig = false }, {
    t("\\Omega"),
  }, { condition = tex_utils.in_mathzone }),
}
