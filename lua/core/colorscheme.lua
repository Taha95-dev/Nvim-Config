-- ~/.config/nvim/lua/core/colorscheme.lua

local function setup_colorscheme()
  -- ── Dark charcoal, high contrast, non-bland ─────────────────
  local colors = {
    -- Surfaces (transparent)
    bg_dark      = "#121212",
    bg           = "#1A1A1A",
    bg_light     = "#222222",
    bg_highlight = "#2E2E2E",
    border       = "#3A3A3A",

    -- Text ladder
    fg           = "#E8E8E8",
    fg_bright    = "#FFFFFF",
    fg_dim       = "#A8A8A8",
    fg_dimmer    = "#7A7A7A",
    fg_dimmest   = "#5A5A5A",

    -- Syntax accents
    kw        = "#8A8A8A",  -- keywords: charcoal gray
    kw2       = "#6E6E6E",  -- return/local: deeper charcoal
    str       = "#9ECF9E",  -- strings: soft sage green
    num       = "#8FB8D8",  -- numbers: soft sky blue
    fn        = "#F0E6D2",  -- functions: cream
    typ       = "#7EC8C8",  -- types: soft teal
    struct    = "#D88BA8",  -- structs: rose
    ident     = "#E0E0E0",  -- identifiers: near-white (neutral)
    op        = "#B0A8C0",  -- operators: muted violet-gray
    punc      = "#8A8A8A",  -- punctuation: neutral gray
    constant  = "#D8A878",  -- constants: burnt orange
    special   = "#C89AC8",  -- special: soft magenta

    -- Functional (diagnostics, git)
    red       = "#E88A8A",
    green     = "#A8D8A8",
    yellow    = "#E8D890",
    blue      = "#A8C0E8",
    orange    = "#E8B88A",
  }

  local hl = vim.api.nvim_set_hl

  -- ── Core UI (transparent) ───────────────────────────────────
  hl(0, "Normal",       { fg = colors.fg,         bg = "NONE" })
  hl(0, "NormalNC",     { fg = colors.fg_dim,     bg = "NONE" })
  hl(0, "NormalFloat",  { fg = colors.fg,         bg = "NONE" })
  hl(0, "FloatBorder",  { fg = colors.border,     bg = "NONE" })
  hl(0, "CursorLine",   { bg = colors.bg_highlight })
  hl(0, "CursorLineNr", { fg = colors.fn,         bg = "NONE", bold = true })
  hl(0, "LineNr",       { fg = colors.fg_dimmest, bg = "NONE" })
  hl(0, "SignColumn",   { bg = "NONE" })
  hl(0, "VertSplit",    { fg = colors.border,     bg = "NONE" })
  hl(0, "WinSeparator", { fg = colors.border,     bg = "NONE" })

  -- ── Barbar tabline ──────────────────────────────────────────
  hl(0, "BufferCurrent",         { fg = colors.fg_bright, bg = "NONE", bold = true })
  hl(0, "BufferCurrentIndex",    { fg = colors.fg_bright, bg = "NONE", bold = true })
  hl(0, "BufferCurrentMod",      { fg = colors.orange,    bg = "NONE", bold = true })
  hl(0, "BufferCurrentSign",     { fg = colors.fg_bright, bg = "NONE" })
  hl(0, "BufferCurrentTarget",   { fg = colors.red,       bg = "NONE", bold = true })
  hl(0, "BufferVisible",         { fg = colors.fg_dim,    bg = "NONE" })
  hl(0, "BufferVisibleIndex",    { fg = colors.fg_dim,    bg = "NONE" })
  hl(0, "BufferVisibleMod",      { fg = colors.orange,    bg = "NONE", bold = true })
  hl(0, "BufferVisibleSign",     { fg = colors.fg_dim,    bg = "NONE" })
  hl(0, "BufferVisibleTarget",   { fg = colors.red,       bg = "NONE", bold = true })
  hl(0, "BufferInactive",        { fg = colors.fg_dimmer, bg = "NONE" })
  hl(0, "BufferInactiveIndex",   { fg = colors.fg_dimmer, bg = "NONE" })
  hl(0, "BufferInactiveMod",     { fg = colors.orange,    bg = "NONE", bold = true })
  hl(0, "BufferInactiveSign",    { fg = colors.fg_dimmer, bg = "NONE" })
  hl(0, "BufferInactiveTarget",  { fg = colors.red,       bg = "NONE", bold = true })
  hl(0, "BufferTabpages",        { fg = colors.fg_dimmer, bg = "NONE" })
  hl(0, "BufferTabpageFill",     { fg = colors.fg_dimmer, bg = "NONE" })
  hl(0, "BufferOffset",          { fg = colors.fg_dimmer, bg = "NONE" })
  hl(0, "BufferCurrentIcon",     { fg = colors.fg_bright, bg = "NONE" })
  hl(0, "BufferVisibleIcon",     { fg = colors.fg_dim,    bg = "NONE" })
  hl(0, "BufferInactiveIcon",    { fg = colors.fg_dimmer, bg = "NONE" })

  -- ── Vim syntax ──────────────────────────────────────────────
  hl(0, "Comment",     { fg = colors.fg_dimmer, italic = true, bg = "NONE" })
  hl(0, "String",      { fg = colors.str,       bg = "NONE" })
  hl(0, "Number",      { fg = colors.num,       bg = "NONE" })
  hl(0, "Boolean",     { fg = colors.num,       bg = "NONE", bold = true })
  hl(0, "Float",       { fg = colors.num,       bg = "NONE" })
  hl(0, "Constant",    { fg = colors.constant,  bg = "NONE" })
  hl(0, "Identifier",  { fg = colors.ident,     bg = "NONE" })
  hl(0, "Function",    { fg = colors.fn,        bg = "NONE", bold = true })
  hl(0, "Keyword",     { fg = colors.kw,        bg = "NONE", bold = true })
  hl(0, "Statement",   { fg = colors.kw,        bg = "NONE", bold = true })
  hl(0, "Conditional", { fg = colors.kw2,       bg = "NONE", bold = true })
  hl(0, "Repeat",      { fg = colors.kw2,       bg = "NONE", bold = true })
  hl(0, "Label",       { fg = colors.kw2,       bg = "NONE", bold = true })
  hl(0, "Operator",    { fg = colors.op,        bg = "NONE" })
  hl(0, "Delimiter",   { fg = colors.punc,      bg = "NONE" })
  hl(0, "Type",        { fg = colors.typ,       bg = "NONE" })
  hl(0, "StorageClass",{ fg = colors.kw,        bg = "NONE", bold = true })
  hl(0, "Structure",   { fg = colors.struct,    bg = "NONE", bold = true })
  hl(0, "PreProc",     { fg = colors.special,   bg = "NONE" })
  hl(0, "Include",     { fg = colors.special,   bg = "NONE", bold = true })
  hl(0, "Define",      { fg = colors.special,   bg = "NONE", bold = true })
  hl(0, "Macro",       { fg = colors.special,   bg = "NONE" })
  hl(0, "Special",     { fg = colors.special,   bg = "NONE" })
  hl(0, "SpecialChar", { fg = colors.special,   bg = "NONE" })
  hl(0, "Underlined",  { underline = true,      bg = "NONE" })
  hl(0, "Error",       { fg = colors.red,       bg = "NONE", bold = true })
  hl(0, "Todo",        { fg = colors.bg_dark, bg = colors.yellow, bold = true })

  -- ── Selection ───────────────────────────────────────────────
  hl(0, "Visual",     { bg = colors.bg_highlight })
  hl(0, "VisualNOS",  { bg = colors.bg_highlight })
  hl(0, "Search",     { fg = colors.bg_dark, bg = colors.yellow, bold = true })
  hl(0, "IncSearch",  { fg = colors.bg_dark, bg = colors.orange, bold = true })
  hl(0, "MatchParen", { fg = colors.fg_bright, bg = "NONE", underline = true, bold = true })

  -- ── Statusline / tabline ────────────────────────────────────
  hl(0, "StatusLine",   { fg = colors.fg,        bg = "NONE" })
  hl(0, "StatusLineNC", { fg = colors.fg_dimmer, bg = "NONE" })
  hl(0, "TabLine",      { fg = colors.fg_dim,    bg = "NONE" })
  hl(0, "TabLineSel",   { fg = colors.fg,        bg = "NONE", bold = true })
  hl(0, "TabLineFill",  { bg = "NONE" })

  -- ── LSP diagnostics ─────────────────────────────────────────
  hl(0, "DiagnosticError", { fg = colors.red,    bg = "NONE" })
  hl(0, "DiagnosticWarn",  { fg = colors.yellow, bg = "NONE" })
  hl(0, "DiagnosticInfo",  { fg = colors.blue,   bg = "NONE" })
  hl(0, "DiagnosticHint",  { fg = colors.green,  bg = "NONE" })
  hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
  hl(0, "DiagnosticUnderlineWarn",  { undercurl = true, sp = colors.yellow })
  hl(0, "DiagnosticUnderlineInfo",  { undercurl = true, sp = colors.blue })
  hl(0, "DiagnosticUnderlineHint",  { undercurl = true, sp = colors.green })
  hl(0, "DiagnosticVirtualTextError", { fg = colors.red,    bg = "NONE", italic = true })
  hl(0, "DiagnosticVirtualTextWarn",  { fg = colors.yellow, bg = "NONE", italic = true })
  hl(0, "DiagnosticVirtualTextInfo",  { fg = colors.blue,   bg = "NONE", italic = true })
  hl(0, "DiagnosticVirtualTextHint",  { fg = colors.green,  bg = "NONE", italic = true })

  -- ── Telescope ───────────────────────────────────────────────
  hl(0, "TelescopeNormal",        { fg = colors.fg,        bg = "NONE" })
  hl(0, "TelescopeBorder",        { fg = colors.border,    bg = "NONE" })
  hl(0, "TelescopePromptNormal",  { fg = colors.fg,        bg = "NONE" })
  hl(0, "TelescopePromptBorder",  { fg = colors.border,    bg = "NONE" })
  hl(0, "TelescopePreviewNormal", { fg = colors.fg_dim,    bg = "NONE" })
  hl(0, "TelescopePreviewBorder", { fg = colors.border,    bg = "NONE" })
  hl(0, "TelescopeResultsNormal", { fg = colors.fg_dim,    bg = "NONE" })
  hl(0, "TelescopeResultsBorder", { fg = colors.border,    bg = "NONE" })
  hl(0, "TelescopeSelection",     { fg = colors.fg_bright, bg = colors.bg_highlight, bold = true })
  hl(0, "TelescopeMatching",      { fg = colors.yellow, bold = true, bg = "NONE" })

  -- ── Treesitter ──────────────────────────────────────────────
  hl(0, "@comment",              { fg = colors.fg_dimmer, italic = true })
  hl(0, "@string",               { fg = colors.str })
  hl(0, "@string.escape",        { fg = colors.special, bold = true })
  hl(0, "@number",               { fg = colors.num })
  hl(0, "@boolean",              { fg = colors.num, bold = true })
  hl(0, "@constant",             { fg = colors.constant })
  hl(0, "@function",             { fg = colors.fn, bold = true })
  hl(0, "@function.call",        { fg = colors.fn, bold = true })
  hl(0, "@function.builtin",     { fg = colors.fn, bold = true })
  hl(0, "@keyword",              { fg = colors.kw,  bold = true })
  hl(0, "@keyword.return",       { fg = colors.kw2, bold = true })
  hl(0, "@keyword.function",     { fg = colors.kw2, bold = true })
  hl(0, "@keyword.type",         { fg = colors.kw,  bold = true })
  hl(0, "@keyword.storage",      { fg = colors.kw,  bold = true })
  hl(0, "@conditional",          { fg = colors.kw2, bold = true })
  hl(0, "@repeat",               { fg = colors.kw2, bold = true })
  hl(0, "@type",                 { fg = colors.typ })
  hl(0, "@type.builtin",         { fg = colors.typ, bold = true })
  hl(0, "@type.definition",      { fg = colors.struct, bold = true })
  hl(0, "@structure",            { fg = colors.struct, bold = true })
  hl(0, "@variable",             { fg = colors.ident })
  hl(0, "@variable.parameter",   { fg = colors.fg_dim })
  hl(0, "@variable.builtin",     { fg = colors.constant, bold = true })
  hl(0, "@property",             { fg = colors.fg_dim })
  hl(0, "@field",                { fg = colors.fg_dim })
  hl(0, "@operator",             { fg = colors.op })
  hl(0, "@punctuation",          { fg = colors.punc })
  hl(0, "@punctuation.bracket",  { fg = colors.punc })
  hl(0, "@punctuation.delimiter",{ fg = colors.punc })
  hl(0, "@namespace",            { fg = colors.typ, bold = true })
  hl(0, "@constructor",          { fg = colors.typ, bold = true })

  -- ── Neo-tree ────────────────────────────────────────────────
  hl(0, "NeoTreeNormal",       { fg = colors.fg,       bg = "NONE" })
  hl(0, "NeoTreeNormalNC",     { fg = colors.fg_dim,   bg = "NONE" })
  hl(0, "NeoTreeWinSeparator", { fg = colors.border,   bg = "NONE" })
  hl(0, "NeoTreeEndOfBuffer",  { fg = colors.border,   bg = "NONE" })
  hl(0, "NeoTreeSignColumn",   { bg = "NONE" })
  hl(0, "NeoTreeCursorLine",   { bg = "NONE" })

  -- ── Alpha dashboard ─────────────────────────────────────────
  hl(0, "AlphaHeader",   { fg = colors.fg_bright, bg = "NONE", bold = true })
  hl(0, "AlphaButtons",  { fg = colors.fg,        bg = "NONE" })
  hl(0, "AlphaShortcut", { fg = colors.yellow,    bg = "NONE", bold = true })
  hl(0, "AlphaFooter",   { fg = colors.fg_dimmer, bg = "NONE", italic = true })

  -- ── DAP UI ──────────────────────────────────────────────────
  hl(0, "DapUINormal",                  { fg = colors.fg,        bg = "NONE" })
  hl(0, "DapUIVariable",                { fg = colors.fg_dim,    bg = "NONE" })
  hl(0, "DapUIScope",                   { fg = colors.special,   bg = "NONE", bold = true })
  hl(0, "DapUIType",                    { fg = colors.typ,       bg = "NONE" })
  hl(0, "DapUIValue",                   { fg = colors.fg,        bg = "NONE" })
  hl(0, "DapUIModifiedValue",           { fg = colors.orange,    bg = "NONE", bold = true })
  hl(0, "DapUIThread",                  { fg = colors.fg_dim,    bg = "NONE" })
  hl(0, "DapUIStoppedThread",           { fg = colors.fg,        bg = "NONE", bold = true })
  hl(0, "DapUIFrameName",               { fg = colors.fg,        bg = "NONE" })
  hl(0, "DapUISource",                  { fg = colors.typ,       bg = "NONE" })
  hl(0, "DapUILineNumber",              { fg = colors.fg_dim,    bg = "NONE" })
  hl(0, "DapUIFloatBorder",             { fg = colors.border,    bg = "NONE" })
  hl(0, "DapUIWatchesEmpty",            { fg = colors.fg_dimmer, bg = "NONE" })
  hl(0, "DapUIWatchesValue",            { fg = colors.fg,        bg = "NONE" })
  hl(0, "DapUIWatchesError",            { fg = colors.red,       bg = "NONE", bold = true })
  hl(0, "DapUIBreakpointsPath",         { fg = colors.special,   bg = "NONE" })
  hl(0, "DapUIBreakpointsInfo",         { fg = colors.fg_dim,    bg = "NONE" })
  hl(0, "DapUIBreakpointsCurrentLine",  { fg = colors.yellow,    bg = "NONE", bold = true })
  hl(0, "DapUIBreakpointsLine",         { fg = colors.fg_dim,    bg = "NONE" })
  hl(0, "DapUIBreakpointsDisabledLine", { fg = colors.fg_dimmer, bg = "NONE" })
  hl(0, "DapUIStepOver",                { fg = colors.blue,      bg = "NONE" })
  hl(0, "DapUIStepInto",                { fg = colors.blue,      bg = "NONE" })
  hl(0, "DapUIStepOut",                 { fg = colors.blue,      bg = "NONE" })
  hl(0, "DapUIStepBack",                { fg = colors.blue,      bg = "NONE" })
  hl(0, "DapUIRestart",                 { fg = colors.green,     bg = "NONE" })
  hl(0, "DapUIPlayPause",               { fg = colors.blue,      bg = "NONE" })

  -- ── Floats with real background ─────────────────────────────
  hl(0, "CmpPmenu",       { fg = colors.fg_dim,     bg = colors.bg_light })
  hl(0, "CmpPmenuBorder", { fg = colors.border,     bg = colors.bg_light })
  hl(0, "CmpPmenuSel",    { fg = colors.fg_bright,  bg = colors.bg_highlight, bold = true })

  -- ── Git signs ───────────────────────────────────────────────
  hl(0, "GitSignsAdd",    { fg = colors.green,  bg = "NONE" })
  hl(0, "GitSignsChange", { fg = colors.orange, bg = "NONE" })
  hl(0, "GitSignsDelete", { fg = colors.red,    bg = "NONE" })

  -- ── Notify ───────────────────────────────────────────────
  require("notify").setup({
    background_colour = "#000000",
  })
end

return setup_colorscheme
