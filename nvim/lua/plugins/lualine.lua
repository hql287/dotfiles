return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local icons = require("lazyvim.config").icons

    opts.options = {
      theme = "auto",
      section_separators = { left = "", right = "" },
      component_separators = "|",
      globalstatus = true,
    }

    opts.sections = {
      lualine_a = { { "mode" } },
      lualine_b = { { "filename", path = 1 } },
      lualine_c = { "branch", "diff", "diagnostics" },
      lualine_x = { "filetype", "lsp_status", "fileformat" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    }
  end,
}
