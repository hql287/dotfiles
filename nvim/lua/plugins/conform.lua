local biome_path

if vim.fn.has("macunix") == 1 then
  -- Running on macOS, use global Biome
  biome_path = "/opt/homebrew/bin/biome" -- Adjust if needed
else
  -- Running inside Docker (Linux), use Biome inside `node_modules`
  biome_path = "./node_modules/.bin/biome"
end

return {
  "stevearc/conform.nvim",
  opts = {
    default_format_opts = {
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      javascriptreact = { "biome" },
      typescript = { "biome" },
      typescriptreact = { "biome" },
      javascript = {
        "biome",
        "prettierd",
        "prettier",
        stop_after_first = true,
      },
    },
    formatters = {
      biome = {
        command = "biome",
        args = { "format", "--stdin-file-path", "$FILENAME" },
        stdin = true,
      },
    },
  },
}
