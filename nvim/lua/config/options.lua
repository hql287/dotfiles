-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------
local g = vim.g -- Global variables
local opt = vim.opt -- opt.options (global/buffer/windows-scoped)

-- Enable this option to avoid conflicts with Prettier.
g.lazyvim_prettier_needs_config = true

-----------------------------------------------------------
-- Overrides (Rules that override LazyVim's defaults)
-----------------------------------------------------------

opt.completeopt = "menu,menuone,noinsert,noselect" -- Adds `noinsert` (LazyVim uses `"menu,menuone,noselect"`)
opt.laststatus = 3 -- Use statusline per window (LazyVim sets `3`, making it global)
opt.ruler = true -- Show the cursor position (LazyVim disables it: `opt.ruler = false`)
opt.scrolloff = 10 -- Keep at least 10 lines below cursor (LazyVim sets `4`)
opt.showmode = true -- Show the current mode (LazyVim disables it: `opt.showmode = false`)
opt.timeoutlen = 1000 -- Set keypress timeout (LazyVim sets `300`)
opt.wrap = true -- Enable line wrapping (LazyVim disables it: `opt.wrap = false`)

-----------------------------------------------------------
-- New Settings (Not included in LazyVim by default)
-----------------------------------------------------------

opt.swapfile = false -- Don't use swapfile
opt.cmdheight = 2 -- Better display for messages
opt.colorcolumn = "80" -- Line length marker at 80 columns
opt.foldmethod = "marker" -- Use 'marker' folding
opt.hlsearch = true -- Keep search matches highlighted
opt.lazyredraw = true -- Don't redraw screen when running macros
opt.numberwidth = 5 -- Set Line Number Width
opt.ttimeoutlen = 0 -- Set keypress timeout for terminal
opt.autoindent = true -- Auto indent
opt.breakindent = true -- Wrap on indentation levels
opt.showbreak = "↳" -- Set break character
opt.showcmd = true -- Show command in bottom bar
opt.showmatch = true -- Highlight matching parenthesis
opt.title = true -- Show the filename in the window titlebar

-- Performance Optimizations
opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 700 -- ms to wait for trigger an event (LazyVim sets `200`)

-- Invisible Characters (LazyVim does not set custom characters)
opt.listchars = {
  eol = "¬",
  extends = "»",
  -- lead = "⋅",
  nbsp = "░",
  precedes = "«",
  tab = "▸·",
  trail = "␣",
}

local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end
