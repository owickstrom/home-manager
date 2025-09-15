require('auto-dark-mode').setup({
  update_interval = 1000,
  fallback = "dark",
  set_dark_mode = function()
    vim.api.nvim_set_option_value('background', 'dark', {})
  end,
  set_light_mode = function()
    vim.api.nvim_set_option_value('background', 'light', {})
  end,
})
