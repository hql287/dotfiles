return {
  "junegunn/vim-easy-align",
  event = "VeryLazy", -- Load it when Vim starts interacting
  keys = {
    { "ga", "<Plug>(EasyAlign)", mode = { "x", "n" }, desc = "Align text" },
  },
}
