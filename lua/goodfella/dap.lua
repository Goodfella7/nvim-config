
local dap = require('dap')
local dapui = require('dapui')

-- Setup UI
dapui.setup()
require("nvim-dap-virtual-text").setup()

-- Simple C++ debug configuration
dap.adapters.cpp = {
  type = 'executable',
  command = 'gdb',
  args = {'-i', 'dap'},
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "cpp",
    request = "launch",
    program = function()
      return vim.fn.getcwd() .. '/main'
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = false,
    args = {},
  },
}

-- Auto open/close DAP UI
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Debug keymaps
vim.keymap.set('n', '<F5>', function() 
  if dap.session() then
    dap.continue()
  else
    dap.run(dap.configurations.cpp[1])
  end
end, { desc = 'Start/Continue debug' })

vim.keymap.set('n', '<F9>', function() dap.toggle_breakpoint() end, { desc = 'Toggle breakpoint' })
vim.keymap.set('n', '<F10>', function() dap.step_over() end, { desc = 'Step over' })
vim.keymap.set('n', '<F11>', function() dap.step_into() end, { desc = 'Step into' })
vim.keymap.set('n', '<F12>', function() dap.step_out() end, { desc = 'Step out' })
vim.keymap.set('n', '<leader>dq', function() dap.terminate() end, { desc = 'Quit debug' })
