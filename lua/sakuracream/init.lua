local M = {}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local default_palette = {
  bg = "#fff6fb",
  bg_alt = "#faedf5",
  bg_highlight = "#f5dfe9",
  fg = "#5d4654",
  fg_alt = "#7b5f6f",
  fg_dim = "#9a7c8c",
  border = "#e6c8d7",
  accent = "#c15886",
  accent_alt = "#a3436b",
  red = "#c04a4a",
  orange = "#c7743b",
  yellow = "#b2871d",
  green = "#4f8a5a",
  teal = "#3b8a83",
  blue = "#4f78a8",
  purple = "#7a5aa8",
}

local defaults = {
  palette = {},
  italic = true,
  italic_comments = true,
  bold = true,
  lualine = true,
  transparent = false,
}

function M.setup(opts)
  M.opts = vim.tbl_deep_extend("force", {}, defaults, opts or {})
end

local function get_opts()
  return M.opts or defaults
end

function M.load()
  local opts = get_opts()
  local p = vim.tbl_deep_extend("force", {}, default_palette, opts.palette or {})

  vim.o.background = "light"
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "sakuracream"

  local base_bg = opts.transparent and "NONE" or p.bg
  local bold = opts.bold and true or false
  local italic = opts.italic and true or false
  local italic_comments = opts.italic_comments and true or false

  hi("Normal", { fg = p.fg, bg = base_bg })
  hi("NormalNC", { fg = p.fg, bg = base_bg })
  hi("NormalFloat", { fg = p.fg, bg = p.bg_alt })
  hi("FloatBorder", { fg = p.border, bg = p.bg_alt })
  hi("ColorColumn", { bg = p.bg_alt })
  hi("CursorLine", { bg = p.bg_alt })
  hi("CursorColumn", { bg = p.bg_alt })
  hi("CursorLineNr", { fg = p.accent, bg = p.bg_alt, bold = bold })
  hi("LineNr", { fg = p.fg_dim })
  hi("SignColumn", { fg = p.fg_dim, bg = base_bg })
  hi("WinSeparator", { fg = p.border })
  hi("VertSplit", { fg = p.border })
  hi("StatusLine", { fg = p.fg, bg = p.bg_highlight })
  hi("StatusLineNC", { fg = p.fg_dim, bg = p.bg_alt })
  hi("TabLine", { fg = p.fg_dim, bg = p.bg_alt })
  hi("TabLineSel", { fg = p.fg, bg = p.bg_highlight, bold = bold })
  hi("TabLineFill", { bg = p.bg_alt })
  hi("Pmenu", { fg = p.fg, bg = p.bg_alt })
  hi("PmenuSel", { fg = p.fg, bg = "#f1cfe0", bold = bold })
  hi("PmenuSbar", { bg = p.bg_alt })
  hi("PmenuThumb", { bg = p.accent })
  hi("WildMenu", { fg = p.fg, bg = "#f1cfe0", bold = bold })
  hi("MatchParen", { fg = p.accent_alt, bg = "#f2d0e2", bold = bold })
  hi("Visual", { bg = "#f2d6e6" })
  hi("Search", { fg = p.fg, bg = "#f3e0a5" })
  hi("IncSearch", { fg = p.fg, bg = "#f7c6d9", bold = bold })
  hi("CurSearch", { fg = p.fg, bg = "#f7c6d9", bold = bold })
  hi("Folded", { fg = p.fg_dim, bg = p.bg_highlight })
  hi("FoldColumn", { fg = p.fg_dim, bg = base_bg })
  hi("Directory", { fg = p.accent })
  hi("Title", { fg = p.accent_alt, bold = bold })
  hi("Whitespace", { fg = "#e3c7d4" })
  hi("NonText", { fg = "#e3c7d4" })
  hi("SpecialKey", { fg = "#e3c7d4" })
  hi("Conceal", { fg = p.fg_dim })

  hi("DiffAdd", { bg = "#e8f4ea" })
  hi("DiffChange", { bg = "#f6ead7" })
  hi("DiffDelete", { bg = "#f6dfe0" })
  hi("DiffText", { bg = "#f3d0e0", fg = p.fg })

  hi("Comment", { fg = p.fg_dim, italic = italic_comments })
  hi("Constant", { fg = p.purple })
  hi("String", { fg = p.green })
  hi("Character", { fg = p.green })
  hi("Number", { fg = p.orange })
  hi("Boolean", { fg = p.orange })
  hi("Float", { fg = p.orange })
  hi("Identifier", { fg = p.fg })
  hi("Function", { fg = p.accent_alt })
  hi("Statement", { fg = p.accent })
  hi("Conditional", { fg = p.accent })
  hi("Repeat", { fg = p.accent })
  hi("Label", { fg = p.accent })
  hi("Operator", { fg = p.fg_alt })
  hi("Keyword", { fg = p.accent })
  hi("Exception", { fg = p.red })
  hi("PreProc", { fg = p.purple })
  hi("Include", { fg = p.purple })
  hi("Define", { fg = p.purple })
  hi("Macro", { fg = p.purple })
  hi("PreCondit", { fg = p.purple })
  hi("Type", { fg = p.blue })
  hi("StorageClass", { fg = p.blue })
  hi("Structure", { fg = p.blue })
  hi("Typedef", { fg = p.blue })
  hi("Special", { fg = p.orange })
  hi("SpecialChar", { fg = p.orange })
  hi("Tag", { fg = p.accent_alt })
  hi("Delimiter", { fg = p.fg_alt })
  hi("SpecialComment", { fg = p.fg_dim, italic = italic_comments })
  hi("Debug", { fg = p.red })
  hi("Underlined", { fg = p.blue, underline = true })
  hi("Ignore", { fg = p.fg_dim })
  hi("Error", { fg = p.red, bold = bold })
  hi("Todo", { fg = p.accent_alt, bg = "#f7e4ef", bold = bold })

  hi("LspReferenceText", { bg = "#f2d6e6" })
  hi("LspReferenceRead", { bg = "#f2d6e6" })
  hi("LspReferenceWrite", { bg = "#f2d6e6" })
  hi("LspSignatureActiveParameter", { fg = p.accent_alt, bold = bold })

  hi("DiagnosticError", { fg = p.red })
  hi("DiagnosticWarn", { fg = p.orange })
  hi("DiagnosticInfo", { fg = p.blue })
  hi("DiagnosticHint", { fg = p.teal })
  hi("DiagnosticVirtualTextError", { fg = p.red, bg = "#f9e1e1" })
  hi("DiagnosticVirtualTextWarn", { fg = p.orange, bg = "#f9eadc" })
  hi("DiagnosticVirtualTextInfo", { fg = p.blue, bg = "#e6eef8" })
  hi("DiagnosticVirtualTextHint", { fg = p.teal, bg = "#e4f1ef" })
  hi("DiagnosticUnderlineError", { sp = p.red, undercurl = true })
  hi("DiagnosticUnderlineWarn", { sp = p.orange, undercurl = true })
  hi("DiagnosticUnderlineInfo", { sp = p.blue, undercurl = true })
  hi("DiagnosticUnderlineHint", { sp = p.teal, undercurl = true })

  hi("@comment", { link = "Comment" })
  hi("@string", { link = "String" })
  hi("@string.escape", { fg = p.orange })
  hi("@string.regex", { fg = p.orange })
  hi("@character", { link = "Character" })
  hi("@number", { link = "Number" })
  hi("@boolean", { link = "Boolean" })
  hi("@float", { link = "Float" })
  hi("@function", { link = "Function" })
  hi("@function.call", { link = "Function" })
  hi("@function.builtin", { fg = p.purple })
  hi("@method", { link = "Function" })
  hi("@method.call", { link = "Function" })
  hi("@constructor", { fg = p.blue })
  hi("@parameter", { fg = p.fg_alt })
  hi("@keyword", { link = "Keyword" })
  hi("@keyword.return", { fg = p.accent })
  hi("@keyword.operator", { fg = p.fg_alt })
  hi("@operator", { link = "Operator" })
  hi("@type", { link = "Type" })
  hi("@type.builtin", { fg = p.blue, italic = italic })
  hi("@property", { fg = p.fg })
  hi("@field", { fg = p.fg })
  hi("@variable", { fg = p.fg })
  hi("@variable.builtin", { fg = p.accent_alt, italic = italic })
  hi("@constant", { link = "Constant" })
  hi("@constant.builtin", { fg = p.purple })
  hi("@namespace", { fg = p.blue })
  hi("@punctuation.delimiter", { fg = p.fg_alt })
  hi("@punctuation.bracket", { fg = p.fg_alt })
  hi("@punctuation.special", { fg = p.accent_alt })

  hi("@tag", { fg = p.accent })
  hi("@tag.attribute", { fg = p.orange })
  hi("@tag.delimiter", { fg = p.fg_alt })

  hi("@markup.heading", { fg = p.accent_alt, bold = bold })
  hi("@markup.list", { fg = p.accent })
  hi("@markup.italic", { fg = p.fg, italic = italic })
  hi("@markup.bold", { fg = p.fg, bold = bold })
  hi("@markup.link.label", { fg = p.blue })
  hi("@markup.link.url", { fg = p.teal, underline = true })
  hi("@markup.quote", { fg = p.fg_alt })
  hi("@markup.raw", { fg = p.purple })

  if opts.lualine then
    hi("LualineA", { fg = p.bg, bg = p.accent, bold = bold })
    hi("LualineB", { fg = p.fg, bg = p.bg_highlight })
    hi("LualineC", { fg = p.fg, bg = p.bg })
    hi("LualineX", { fg = p.fg, bg = p.bg })
    hi("LualineY", { fg = p.fg, bg = p.bg_highlight })
    hi("LualineZ", { fg = p.bg, bg = p.accent, bold = bold })

    hi("LualineAInsert", { fg = p.bg, bg = p.green, bold = bold })
    hi("LualineAVisual", { fg = p.bg, bg = p.purple, bold = bold })
    hi("LualineAReplace", { fg = p.bg, bg = p.red, bold = bold })
    hi("LualineACommand", { fg = p.bg, bg = p.blue, bold = bold })
    hi("LualineAInactive", { fg = p.fg_dim, bg = p.bg_alt, bold = bold })
    hi("LualineBInactive", { fg = p.fg_dim, bg = p.bg_alt })
    hi("LualineCInactive", { fg = p.fg_dim, bg = p.bg_alt })
  end

  hi("GitSignsAdd", { fg = p.green })
  hi("GitSignsChange", { fg = p.orange })
  hi("GitSignsDelete", { fg = p.red })
end

return M
