# sakuracream.nvim

Soft pink light colorscheme for Neovim.

## Usage

Place this repo on your `runtimepath`, then:

```vim
colorscheme sakuracream
```

## Setup (optional)

```lua
require("sakuracream").setup({
  italic = true,
  italic_comments = true,
  bold = true,
  lualine = true,
  transparent = false,
  palette = {
    -- override any color from the palette
    -- accent = "#c15886",
  },
})

vim.cmd.colorscheme("sakuracream")
```

## Lualine theme

```lua
require("lualine").setup({
  options = {
    theme = "sakuracream",
  },
})
```

## Notes

- Designed for `background=light`.
- Uses subtle pinks with muted contrast to stay easy on the eyes.
