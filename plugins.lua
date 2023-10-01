local plugins = {
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function(_, opts)
      local path = "~/Appdata/Local/nvim-data/mason/packages/debugpy/venv/Scripts/python.exe"
      require("dap-python").setup(path)
    end
  },
  
  { -- Allows non LSP tools to have LSP interface
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  { -- LSP default configurations
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  { -- Coding related plugin manager
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",     -- C/C++ LSP
        "clang-format", -- auto formatter
        "codelldb", -- LLVM debug tools
        "cpptools", -- GDB debug tools
        "black",  -- Auto formatter
        "debugpy",  -- Debugger for Python
        "mypy", -- static type checking
        "ruff", -- faster python linting
        "pyright", -- Python LSP
      }
    }
  }
}
return plugins
