local p = {
	bg = "#fff6fb",
	bg_alt = "#faedf5",
	bg_highlight = "#f5dfe9",
	fg = "#5d4654",
	fg_dim = "#9a7c8c",
	accent = "#c15886",
	red = "#c04a4a",
	green = "#4f8a5a",
	blue = "#4f78a8",
	purple = "#7a5aa8",
}

return {
	normal = {
		a = { fg = p.bg, bg = p.accent, gui = "bold" },
		b = { fg = p.fg, bg = p.bg_highlight },
		c = { fg = p.fg, bg = p.bg },
	},
	insert = {
		a = { fg = p.bg, bg = p.green, gui = "bold" },
		b = { fg = p.fg, bg = p.bg_highlight },
		c = { fg = p.fg, bg = p.bg },
	},
	visual = {
		a = { fg = p.bg, bg = p.purple, gui = "bold" },
		b = { fg = p.fg, bg = p.bg_highlight },
		c = { fg = p.fg, bg = p.bg },
	},
	replace = {
		a = { fg = p.bg, bg = p.red, gui = "bold" },
		b = { fg = p.fg, bg = p.bg_highlight },
		c = { fg = p.fg, bg = p.bg },
	},
	command = {
		a = { fg = p.bg, bg = p.blue, gui = "bold" },
		b = { fg = p.fg, bg = p.bg_highlight },
		c = { fg = p.fg, bg = p.bg },
	},
	inactive = {
		a = { fg = p.fg_dim, bg = p.bg_alt, gui = "bold" },
		b = { fg = p.fg_dim, bg = p.bg_alt },
		c = { fg = p.fg_dim, bg = p.bg_alt },
	},
}
