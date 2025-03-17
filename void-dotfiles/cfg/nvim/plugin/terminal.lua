--          ╔═════════════════════════════════════════════════════════╗
--          ║                   Toggle Terminal                       ║
--          ╚═════════════════════════════════════════════════════════╝
local terminal_buffers = {}

local function toggle_terminal()
  local current_tab = vim.api.nvim_get_current_tabpage()
  local windows = vim.api.nvim_tabpage_list_wins(current_tab)
  local terminal_bufnr = terminal_buffers[current_tab]

  -- Check if terminal exists and is valid for current tab
  if terminal_bufnr and vim.api.nvim_buf_is_valid(terminal_bufnr) then
    -- Check if terminal window is open in current tab
    local found = false
    for _, win in ipairs(windows) do
      if vim.api.nvim_win_get_buf(win) == terminal_bufnr then
        vim.api.nvim_win_close(win, true)
        found = true
      end
    end

    if not found then
      -- Create new window for existing terminal buffer
      vim.cmd('botright 10 split')
      vim.api.nvim_win_set_buf(0, terminal_bufnr)
      vim.wo.number = false
      vim.wo.relativenumber = false
      vim.wo.signcolumn = 'no'
    end
  else
    -- Create new terminal buffer and window
    terminal_buffers[current_tab] = vim.api.nvim_create_buf(false, false)
    vim.fn.termopen(vim.o.shell)

    vim.cmd('botright 10 split')
    vim.api.nvim_win_set_buf(0, terminal_buffers[current_tab])

    -- Configure window appearance
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.wo.signcolumn = 'no'
    vim.wo.winfixheight = true
  end
end

-- Set key mapping for normal mode
vim.keymap.set('n', '<C-t>', toggle_terminal)
