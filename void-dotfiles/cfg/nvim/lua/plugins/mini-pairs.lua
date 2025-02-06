-----------------------------------------------------------
-- Mini-Paris
-----------------------------------------------------------
return {
  'echasnovski/mini.pairs',
  version = '*',
  config = function()
    require('mini.pairs').setup({
      modes = { insert = true, command = true, terminal = false },
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      skip_ts = { "string" },
      skip_unbalanced = true,
      markdown = true,
    })
  end
}
