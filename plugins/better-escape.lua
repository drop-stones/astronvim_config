return {
  "max397574/better-escape.nvim",
  opts = {
    mapping = { "jk", "kj", "ｊｋ", "ｋｊ" },
    timeout = 300,
    keys = function() return vim.api.nvim_win_get_cursor(0)[2] > 1 and "<Esc>l" or "<Esc>" end,
  },
}
