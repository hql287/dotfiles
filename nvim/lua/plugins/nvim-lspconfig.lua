return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      eslint = false, -- Disable ESLint LSP,
      vtsls = {
        settings = {
          diagnostics = {
            enable = false, -- Disable linting from vtsls
          },
        },
      },
      tsserver = {
        init_options = {
          preferences = {
            disableSuggestions = true,
          },
        },
        handlers = {
          ["textDocument/publishDiagnostics"] = function() end, -- Prevents linting errors from tsserver
        },
      },
    },
  },
}
