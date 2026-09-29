-- ~/.config/nvim/lua/core/colorscheme.lua

local function setup_colorscheme()
  local colors = {
      fg  = "#F5EFE6",  -- bright cream      (keywords, functions, types)
      fg2 = "#D4C9B8",  -- warm tan          (identifiers, variables)
      fg3 = "#8FA1B3",  -- cool steel blue   (strings, numbers, constants) ← accent
      fg4 = "#7A7D82",  -- medium gray       (operators, punctuation)
      fg5 = "#5A5D62",  -- dim gray          (comments)
    }
  
  local hl = vim.api.nvim_set_hl
  
  -- Make ALL backgrounds transparent
  hl(0, "Normal", { fg = colors.fg, bg = "NONE" })
  hl(0, "NormalNC", { fg = colors.fg2, bg = "NONE" })
  hl(0, "NormalFloat", { fg = colors.fg, bg = "NONE" })
  hl(0, "FloatBorder", { fg = colors.fg5, bg = "NONE" })
  hl(0, "CursorLine", { bg = "#1e1e1e" })
  hl(0, "CursorLineNr", { fg = colors.fg3, bg = "NONE" })
  hl(0, "LineNr", { fg = colors.fg5, bg = "NONE" })
  hl(0, "SignColumn", { bg = "NONE" })
  hl(0, "VertSplit", { fg = colors.fg5, bg = "NONE" })
  hl(0, "WinSeparator", { fg = colors.fg5, bg = "NONE" })

  -- Barbar tabline — transparent, text-only
  local bg_active   = "NONE"      -- no background
  local fg_active   = "#ffffff"   -- white text (active)
  local bg_inactive = "NONE"      -- no background
  local fg_inactive = "#6a6d73"   -- gray text (inactive)
  local fg_dim      = "#505257"   -- dim gray for very inactive

  hl(0, "BufferCurrent",          { fg = fg_active,   bg = "NONE", bold = true })
  hl(0, "BufferCurrentIndex",     { fg = fg_active,   bg = "NONE" })
  hl(0, "BufferCurrentMod",       { fg = "#e67e22",   bg = "NONE", bold = true })
  hl(0, "BufferCurrentSign",      { fg = fg_active,   bg = "NONE" })
  hl(0, "BufferCurrentTarget",    { fg = "#e74c3c",   bg = "NONE", bold = true })

  hl(0, "BufferVisible",          { fg = fg_inactive, bg = "NONE" })
  hl(0, "BufferVisibleIndex",     { fg = fg_inactive, bg = "NONE" })
  hl(0, "BufferVisibleMod",       { fg = "#e67e22",   bg = "NONE", bold = true })
  hl(0, "BufferVisibleSign",      { fg = fg_inactive, bg = "NONE" })
  hl(0, "BufferVisibleTarget",    { fg = "#e74c3c",   bg = "NONE", bold = true })

  hl(0, "BufferInactive",         { fg = fg_dim,      bg = "NONE" })
  hl(0, "BufferInactiveIndex",    { fg = fg_dim,      bg = "NONE" })
  hl(0, "BufferInactiveMod",      { fg = "#e67e22",   bg = "NONE", bold = true })
  hl(0, "BufferInactiveSign",     { fg = fg_dim,      bg = "NONE" })
  hl(0, "BufferInactiveTarget",   { fg = "#e74c3c",   bg = "NONE", bold = true })

  hl(0, "BufferTabpages",         { fg = fg_dim,      bg = "NONE" })
  hl(0, "BufferTabpageFill",      { fg = fg_dim,      bg = "NONE" })

  hl(0, "BufferOffset",           { fg = fg_dim,      bg = "NONE" })
  hl(0, "BufferCurrentIcon",      { fg = fg_active,   bg = "NONE" })
  hl(0, "BufferVisibleIcon",      { fg = fg_inactive, bg = "NONE" })
  hl(0, "BufferInactiveIcon",     { fg = fg_dim,      bg = "NONE" })

  -- Text
  hl(0, "Comment", { fg = colors.fg5, italic = true, bg = "NONE" })
  hl(0, "String", { fg = colors.fg3, bg = "NONE" })
  hl(0, "Number", { fg = colors.fg3, bg = "NONE" })
  hl(0, "Boolean", { fg = colors.fg3, bg = "NONE" })
  hl(0, "Identifier", { fg = colors.fg2, bg = "NONE" })
  hl(0, "Function", { fg = colors.fg, bg = "NONE" })
  hl(0, "Keyword", { fg = colors.fg, bg = "NONE" })
  hl(0, "Statement", { fg = colors.fg, bg = "NONE" })
  hl(0, "Operator", { fg = colors.fg4, bg = "NONE" })
  hl(0, "Type", { fg = colors.fg2, bg = "NONE" })
  hl(0, "PreProc", { fg = colors.fg2, bg = "NONE" })
  hl(0, "Special", { fg = colors.fg3, bg = "NONE" })
  hl(0, "Underlined", { fg = colors.fg2, underline = true, bg = "NONE" })
  hl(0, "Error", { fg = "#e74c3c", bg = "NONE" })
  hl(0, "Todo", { fg = colors.fg, bold = true, bg = "NONE" })
  
  -- Selection
  hl(0, "Visual", { bg = "#2a2a2a" })
  hl(0, "VisualNOS", { bg = "#2a2a2a" })
  hl(0, "Search", { fg = "#000000", bg = "#e8e8e8" })
  hl(0, "IncSearch", { fg = "#000000", bg = "#cccccc" })
  hl(0, "MatchParen", { fg = "#e8e8e8", bg = "NONE", underline = true })
  
  -- Statusline
  hl(0, "StatusLine", { fg = colors.fg, bg = "NONE" })
  hl(0, "StatusLineNC", { fg = colors.fg5, bg = "NONE" })
  hl(0, "TabLine", { fg = colors.fg4, bg = "NONE" })
  hl(0, "TabLineSel", { fg = colors.fg, bg = "NONE" })
  hl(0, "TabLineFill", { bg = "NONE" })
  
  -- LSP Diagnostics
  hl(0, "DiagnosticError", { fg = "#e74c3c", bg = "NONE" })
  hl(0, "DiagnosticWarn", { fg = "#e67e22", bg = "NONE" })
  hl(0, "DiagnosticInfo", { fg = "#4a9eff", bg = "NONE" })
  hl(0, "DiagnosticHint", { fg = "#4ae89a", bg = "NONE" })
  
  -- Telescope (transparent)
  hl(0, "TelescopeNormal", { fg = colors.fg, bg = "NONE" })
  hl(0, "TelescopeBorder", { fg = colors.fg5, bg = "NONE" })
  hl(0, "TelescopePromptNormal", { fg = colors.fg, bg = "NONE" })
  hl(0, "TelescopePromptBorder", { fg = colors.fg5, bg = "NONE" })
  hl(0, "TelescopePreviewNormal", { fg = colors.fg2, bg = "NONE" })
  hl(0, "TelescopePreviewBorder", { fg = colors.fg5, bg = "NONE" })
  hl(0, "TelescopeResultsNormal", { fg = colors.fg2, bg = "NONE" })
  hl(0, "TelescopeResultsBorder", { fg = colors.fg5, bg = "NONE" })
  -- FIX: Changed bg to match your Visual selection so highlighted items are readable
  hl(0, "TelescopeSelection", { fg = colors.fg, bg = "#2a2a2a", underline = false })
  hl(0, "TelescopeMatching", { fg = colors.fg3, bold = true, bg = "NONE" })
  
  -- Treesitter
  hl(0, "@comment", { fg = colors.fg5, italic = true, bg = "NONE" })
  hl(0, "@string", { fg = colors.fg3, bg = "NONE" })
  hl(0, "@number", { fg = colors.fg3, bg = "NONE" })
  hl(0, "@function", { fg = colors.fg, bg = "NONE" })
  hl(0, "@keyword", { fg = colors.fg, bg = "NONE" })
  hl(0, "@type", { fg = colors.fg2, bg = "NONE" })
  hl(0, "@variable", { fg = colors.fg2, bg = "NONE" }) -- FIX: Variables changed from fg to fg2 to separate from functions/keywords
  hl(0, "@operator", { fg = colors.fg4, bg = "NONE" })
  hl(0, "@punctuation", { fg = colors.fg4, bg = "NONE" })
  hl(0, "@property", { fg = colors.fg2, bg = "NONE" })
  -- FIX: Added parameters to cleanly distinguish function definitions
  hl(0, "@parameter", { fg = colors.fg2, bg = "NONE" })

  -- Neo-tree transparency
  hl(0, "NeoTreeNormal", { fg = colors.fg, bg = "NONE" })
  hl(0, "NeoTreeNormalNC", { fg = colors.fg2, bg = "NONE" })
  hl(0, "NeoTreeWinSeparator", { fg = colors.fg5, bg = "NONE" })
  hl(0, "NeoTreeEndOfBuffer", { fg = colors.fg5, bg = "NONE" })
  hl(0, "NeoTreeSignColumn", { bg = "NONE" })
  hl(0, "NeoTreeCursorLine", { bg = "NONE" })

  -- Alpha Dashboard
  hl(0, "AlphaHeader", { fg = "#E6DDD5", bg = "NONE", bold = true })
  hl(0, "AlphaButtons", { fg = "#9AA0A6", bg = "NONE" })
  hl(0, "AlphaShortcut", { fg = "#A38D73", bold = true, bg = "NONE" })
  hl(0, "AlphaFooter", { fg = "#6a6d73", italic = true, bg = "NONE" })

  -- DAP UI Completed
  hl(0, "DapUINormal",              { fg = colors.fg,  bg = "NONE" })
  hl(0, "DapUIVariable",            { fg = colors.fg2, bg = "NONE" })
  hl(0, "DapUIScope",               { fg = colors.fg3, bg = "NONE" })
  hl(0, "DapUIType",                { fg = colors.fg3, bg = "NONE" })
  hl(0, "DapUIValue",               { fg = colors.fg,  bg = "NONE" })
  hl(0, "DapUIModifiedValue",       { fg = "#e67e22",  bg = "NONE", bold = true })
  hl(0, "DapUIThread",              { fg = colors.fg2, bg = "NONE" })
  hl(0, "DapUIStoppedThread",       { fg = colors.fg,  bg = "NONE", bold = true })
  hl(0, "DapUIFrameName",           { fg = colors.fg,  bg = "NONE" })
  hl(0, "DapUISource",              { fg = colors.fg3, bg = "NONE" })
  hl(0, "DapUILineNumber",          { fg = colors.fg3, bg = "NONE" })
  hl(0, "DapUIFloatBorder",         { fg = colors.fg5, bg = "NONE" })
  hl(0, "DapUIWatchesEmpty",        { fg = colors.fg5, bg = "NONE" })
  hl(0, "DapUIWatchesValue",        { fg = colors.fg,  bg = "NONE" })
  hl(0, "DapUIWatchesError",        { fg = "#e74c3c",  bg = "NONE" })
  hl(0, "DapUIBreakpointsPath",     { fg = colors.fg3, bg = "NONE" })
  hl(0, "DapUIBreakpointsInfo",     { fg = colors.fg3, bg = "NONE" })
  hl(0, "DapUIBreakpointsCurrentLine", { fg = "#e67e22", bg = "NONE", bold = true })
  hl(0, "DapUIBreakpointsLine",     { fg = colors.fg2, bg = "NONE" })
  hl(0, "DapUIBreakpointsDisabledLine", { fg = colors.fg5, bg = "NONE" })
  hl(0, "DapUIStepOver",            { fg = colors.fg2, bg = "NONE" })
  hl(0, "DapUIStepInto",            { fg = colors.fg2, bg = "NONE" })
  hl(0, "DapUIStepOut",             { fg = colors.fg2, bg = "NONE" })
  hl(0, "DapUIStepBack",            { fg = colors.fg2, bg = "NONE" })
  hl(0, "DapUIRestart",             { fg = "#4ae89a",  bg = "NONE" })
  hl(0, "DapUIPlayPause",           { fg = "#4a9eff",  bg = "NONE" })

  -- ESSENTIAL CRITICAL FIXES FOR FULL TRANSPARENCY

  -- 1. Nvim-Cmp (Autocomplete floats need backgrounds or text blends into code)
  hl(0, "CmpPmenu",                 { fg = colors.fg2, bg = "#141414" })
  hl(0, "CmpPmenuBorder",           { fg = colors.fg5, bg = "#141414" })
  hl(0, "CmpPmenuSel",              { fg = colors.fg,  bg = "#2a2a2a", bold = true })
  
  -- 2. Git Gutter (Gitsigns icons look best transparent)
  hl(0, "GitSignsAdd",              { fg = "#4ae89a", bg = "NONE" })
  hl(0, "GitSignsChange",           { fg = "#e67e22", bg = "NONE" })
  hl(0, "GitSignsDelete",           { fg = "#e74c3c", bg = "NONE" })
end

return setup_colorscheme
