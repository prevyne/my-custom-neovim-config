-- Hacker Green Ultimate V5
-- Author: Prevyne Okech
-- Neovim Tree-sitter + LSP aware colorscheme

vim.cmd("highlight clear")
vim.cmd("set termguicolors")
vim.g.colors_name = "hacker_green_ultimate"

-- =========================
-- PALETTE
-- =========================
local c = {
  black        = "#000000",
  neon_green  = "#00FF00",
  dim_green   = "#004400",

  magenta     = "#FF00FF",
  gold        = "#FFD700",
  cyan        = "#00FFFF",
  orange      = "#FF8800",
  white       = "#FFFFFF",
  blue        = "#44AAFF",
  red         = "#FF3333",
  hibiscus   = "#bf2473",

  selection_bg = "#003b00",
  selection_fg = "#66ff66",
  line_hi     = "#111111",
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- =========================
-- GLOBAL UI
-- =========================
hl("Normal",        { fg = c.neon_green, bg = c.black })
hl("Cursor",        { fg = c.black, bg = c.neon_green })
hl("Visual",        { bg = c.selection })
hl("LineNr",        { fg = c.dim_green })
hl("CursorLineNr",  { fg = c.neon_green, bold = true })
hl("SignColumn",    { bg = c.black })
hl("VertSplit",     { fg = c.dim_green })
hl("Visual", {
  bg = c.selection_bg,
  fg = c.selection_fg,
  underline = true,
})
hl("CursorLine", {
  bg = "#002800",
})

-- =========================
-- COMMENTS & DOCSTRINGS
-- =========================
hl("Comment", { fg = c.dim_green, italic = true })

-- =========================
-- KEYWORDS & STRUCTURE
-- =========================
hl("Keyword",        { fg = c.white, italic = true })
hl("Conditional",   { fg = c.white, italic = true })
hl("Repeat",        { fg = c.white, italic = true })
hl("Return",        { fg = c.white, italic = true })

hl("Include",       { fg = c.magenta, italic = true })
hl("Define",        { fg = c.magenta, italic = true })
hl("StorageClass",  { fg = c.magenta, italic = true })

-- =========================
-- ENTITIES & NAMES
-- =========================
hl("Function",      { fg = c.white, bold = true })
hl("Identifier",   { fg = c.neon_green })
hl("Parameter",    { fg = c.white, italic = true })

hl("Type",          { fg = c.orange, bold = true })
hl("Structure",     { fg = c.hibiscus, italic = true })

hl("Field",         { fg = c.gold, italic = true })
hl("Property",      { fg = c.gold, italic = true })

-- =========================
-- LITERALS & CONSTANTS
-- =========================
hl("String",        { fg = c.cyan })
hl("Number",        { fg = c.neon_green })
hl("Boolean",       { fg = c.neon_green })
hl("Constant",      { fg = c.neon_green })

-- =========================
-- PYTHON SPECIALS
-- =========================
hl("Special",       { fg = c.orange, italic = true }) -- self / cls
hl("Builtin",       { fg = c.blue })
hl("Exception",     { fg = c.red, bold = true })
hl("Decorator",     { fg = c.gold })

-- =========================
-- OPERATORS & SYMBOLS
-- =========================
hl("Operator",      { fg = c.gold })
hl("Delimiter",     { fg = c.gold })

-- =========================
-- TREE-SITTER MAPPINGS
-- =========================
hl("@comment",                  { link = "Comment" })

hl("@keyword",                  { fg = c.white, italic = true })
hl("@keyword.import",           { fg = c.magenta, italic = true })
hl("@keyword.function",         { fg = c.magenta, italic = true })

hl("@function",                 { fg = c.white, bold = true })
hl("@function.builtin",         { fg = c.blue })

hl("@parameter",                { fg = c.white, italic = true })
hl("@variable",                 { fg = c.neon_green, italic = true })
hl("@variable.builtin",         { fg = c.orange, italic = true })

hl("@field",                    { fg = c.gold, italic = true })
hl("@property",                 { fg = c.gold, italic = true })

hl("@type",                     { fg = c.orange, bold = true })
hl("@type.builtin",             { fg = c.blue, italic = true })
hl("@exception",                { fg = c.red, bold = true })

hl("@string",                   { fg = c.cyan })
hl("@number",                   { fg = c.neon_green })
hl("@boolean",                  { fg = c.neon_green })

hl("@punctuation",              { fg = c.gold })
hl("@operator",                 { fg = c.gold })

