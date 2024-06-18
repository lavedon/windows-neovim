local dap = require('dap')

dap.adapters.coreclr = {
  type = 'executable',
  command = 'C://my-coding-projects//netcoredbg//netcoredbg.exe',
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
    stopAtEntry = true
  },
}


dap.defaults.fallback.external_terminal = {
  command = 'C:\\Program Files\\PowerShell\\7\\pwsh.exe',
  args = {'/C', 'start'}
}
dap.set_log_level('DEBUG')
dap.defaults.fallback.logging = { level = 'DEBUG', path = '/path/to/dap.log' }
