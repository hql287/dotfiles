-- Returns the project-local biome binary if available, otherwise falls back to global
local function get_biome_command()
  local local_biome = vim.fn.findfile("node_modules/.bin/biome", vim.fn.getcwd() .. ";")
  if local_biome ~= "" then
    return vim.fn.fnamemodify(local_biome, ":p")
  end
  return vim.fn.has("macunix") == 1 and "/opt/homebrew/bin/biome" or "biome"
end

-- Returns true if the project has a biome config file
local function has_biome_config()
  return vim.fn.findfile("biome.json", vim.fn.getcwd() .. ";") ~= ""
    or vim.fn.findfile("biome.jsonc", vim.fn.getcwd() .. ";") ~= ""
end

-- Formatter list: prefer biome when project has biome config, otherwise use prettier
local function js_formatters()
  if has_biome_config() then
    return { "biome", stop_after_first = true }
  end
  return { "prettierd", "prettier", stop_after_first = true }
end

return {
  "stevearc/conform.nvim",
  opts = {
    default_format_opts = {
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      javascriptreact = js_formatters,
      typescript = js_formatters,
      typescriptreact = js_formatters,
      javascript = js_formatters,
    },
    formatters = {
      biome = {
        command = get_biome_command,
        args = { "format", "--stdin-file-path", "$FILENAME" },
        stdin = true,
      },
    },
  },
}
