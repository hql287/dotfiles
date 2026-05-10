return {
  "ojroques/nvim-osc52",
  lazy = true, -- Load only when needed
  keys = {
    -- Example mappings (adjust as you like)
    {
      "<leader>y",
      function()
        require("osc52").copy_operator()
      end,
      desc = "Copy with OSC52 (operator)",
      mode = "n",
      expr = true,
    },
    { "<leader>yy", "<leader>y_", remap = true, desc = "Copy line with OSC52", mode = "n" },
    {
      "<leader>y",
      function()
        require("osc52").copy_visual()
      end,
      desc = "Copy selection with OSC52",
      mode = "v",
    },
  },
  opts = {
    max_length = 0, -- 0 = no limit
    silent = false, -- Show message on copy
    trim = false, -- Trim whitespace
    tmux_passthrough = true, -- Set true if using tmux + allow-passthrough
  },
}
