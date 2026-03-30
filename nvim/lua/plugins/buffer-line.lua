return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      numbers = "ordinal", -- Show buffer numbers
      diagnostics = "nvim_lsp", -- Display LSP diagnostics
      separator_style = "slant", -- Stylish separators (other options: "thick", "thin", "padded_slant")
      always_show_bufferline = true, -- Show bufferline even if there's only one buffer
      show_buffer_close_icons = true, -- Show close icons on each buffer
      show_close_icon = false, -- Hide the global close icon
      enforce_regular_tabs = false, -- Use different tab sizes
      modified_icon = "●", -- Show modified buffer indicator
      buffer_close_icon = "󰅖", -- Unicode close icon
      left_trunc_marker = "", -- Left navigation indicator
      right_trunc_marker = "", -- Right navigation indicator
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
      },
    },
  },
  keys = {
    {
      "<Tab>",
      function()
        vim.cmd("bnext " .. vim.v.count1)
      end,
      desc = "Next buffer",
    },
    {
      "<S-Tab>",
      function()
        vim.cmd("bprev " .. vim.v.count1)
      end,
      desc = "Previous buffer",
    },
  },
}
