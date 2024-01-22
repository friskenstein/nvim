vim.g.minimap_global_toggle = false

vim.api.nvim_create_autocmd({"BufEnter", "Filetype"}, {
  pattern = "*",
  callback = function()
    local exclude_ft = {
      "qf",
      "NvimTree",
      "toggleterm",
      "TelescopePrompt",
      "alpha",
      "netrw",
    }

    local map = require('mini.map')
    if vim.tbl_contains(exclude_ft, vim.o.filetype) or not vim.g.minimap_global_toggle then
      vim.b.minimap_disable = true
      map.close()
    elseif vim.o.buftype == "" then
      vim.b.minimap_disable = false
      map.open()
    end
  end,
})
