-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")
local M = {}

-- Function to simplify setting keymaps
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-----------------------------------------------------------
-- Vim Kitty Navigator Integration
-----------------------------------------------------------

-- Prevent the plugin from adding its own keymaps
vim.g.kitty_navigator_no_mappings = 1

-- Use KittyNavigator commands explicitly
map("n", "<C-h>", ":KittyNavigateLeft<CR>")
map("n", "<C-j>", ":KittyNavigateDown<CR>")
map("n", "<C-k>", ":KittyNavigateUp<CR>")
map("n", "<C-l>", ":KittyNavigateRight<CR>")

-----------------------------------------------------------
-- Overrides (Rules that override LazyVim's defaults)
-----------------------------------------------------------

-- Change leader key to comma (LazyVim sets it to space)
-- vim.g.mapleader = ","

-- Disable arrow keys (LazyVim does not disable these)
map("", "<Up>", "<nop>")
map("", "<Down>", "<nop>")
map("", "<Left>", "<nop>")
map("", "<Right>", "<nop>")

-- Make j and k move visually instead of by actual line numbers (LazyVim already does this but with `v:count`)
map("n", "j", "gj")
map("n", "k", "gk")

-- Move around splits using Ctrl + {h,j,k,l} (LazyVim does this, but without remapping explicitly)
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-----------------------------------------------------------
-- New Settings (Not included in LazyVim by default)
-----------------------------------------------------------

-- Map Esc to jk and kj
map("i", "jk", "<Esc>")
map("i", "kj", "<Esc>")

-- Quick Save
map("n", "<S-s>", ":w<CR>")

-- Yank to end of line
map("n", "Y", "y$")

-- Delete to the end of line
map("n", "D", "d$")

-- Keep search results at the center of screen
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("n", "*", "*zz")
map("n", "#", "#zz")
map("n", "g*", "g*zz")
map("n", "g#", "g#zz")

local mappings = {
  {
    "<leader><CR>",
    ":nohl<CR>",
    desc = "Remove Search Highlight",
    mode = "n",
    icon = "❌",
  },
  {
    "<leader>a",
    "<cmd>normal! ggVG<CR>",
    desc = "Select All",
    mode = "n",
    icon = "󰒉",
  },
}

-- Copy the path of the current buffer
table.insert(mappings, {
  "<leader>yc",
  function()
    local filepath = vim.fn.expand("%:p") -- full path
    vim.fn.setreg("+", filepath) -- copy to system clipboard
    vim.notify("📋 Copied: " .. filepath)
  end,
  mode = "n",
  desc = "Copy full file path",
  icon = "",
})

table.insert(mappings, {
  "<leader>yr",
  function()
    local relpath = vim.fn.expand("%:.") -- relative to :pwd
    vim.fn.setreg("+", relpath)
    vim.notify("📋 Copied relative path: " .. relpath)
  end,
  mode = "n",
  desc = "Copy relative file path",
  icon = "",
})

wk.add({ mappings })

M.map = map
return M
