local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<F9>"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<F5>"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    },
     ["<F10>"] = {
      "<cmd> DapStepOver <CR>",
      "Step over",
    },
     ["<F11>"] = {
      "<cmd> DapStepInto <CR>",
      "Step into",
    }
  }
}

return M
