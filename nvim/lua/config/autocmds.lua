-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-----------------------------------------------------------
-- Overrides (Rules that override LazyVim's defaults)
-----------------------------------------------------------

local M = {}
local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Go to last loc when opening a buffer (Override LazyVim with simpler logic)
autocmd("BufReadPost", {
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]],
})

-----------------------------------------------------------
-- New Settings (Not included in LazyVim by default)
-----------------------------------------------------------

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
  pattern = "*",
  command = ":%s/\\s\\+$//e",
})

-- Set indentation to 2 spaces for specific file types
local indentGrp = augroup("setIndent", { clear = true })
autocmd("FileType", {
  group = indentGrp,
  pattern = {
    "xml",
    "html",
    "xhtml",
    "css",
    "scss",
    "javascript",
    "typescript",
    "yaml",
    "lua",
  },
  command = "setlocal shiftwidth=2 tabstop=2",
})

-- Show cursor line only in active window
local cursorGrp = augroup("CursorLine", { clear = true })
autocmd({ "InsertLeave", "WinEnter" }, {
  pattern = "*",
  command = "set cursorline",
  group = cursorGrp,
})
autocmd({ "InsertEnter", "WinLeave" }, {
  pattern = "*",
  command = "set nocursorline",
  group = cursorGrp,
})

M.augroup = augroup
M.autocmd = autocmd
return M
