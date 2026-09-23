-- local status_ok, dap_vs_code_js = pcall(require, "dap-vscode-js")
-- if not status_ok then
--   return
-- end
--
dap = require("dap")

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {vim.fn.expand("~/.local/share/nvim/manual/js-debug/src/dapDebugServer.js"), "${port}"},  -- Cambia la ruta a tu instalación
  }
}

dap.adapters["pwa-chrome"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {vim.fn.expand("~/.local/share/nvim/manual/js-debug/src/dapDebugServer.js"), "${port}"},  -- Cambia la ruta a tu instalación
  }
}

-- https://github.com/mxsdev/nvim-dap-vscode-js
-- add this on package.json to allow ESM modules "type": "module",
--add this to tsconfig.json to allow ESM modules
-- "module": "esnext",
-- "target": "esnext",
-- "moduleResolution": "node",
dap.configurations.javascript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    skipFiles = {
      "${workspaceFolder}/node_modules/**/*.js",
      "${workspaceFolder}\\node_modules\\**\\*.js",
      "<node_internals>/**/*.js",
      "<node_internals>\\**\\*.js",
      "<node_internals>/**",
      "node_modules/**"
    },
    sourceMaps = true,
    cwd = "${workspaceFolder}",
    console = "integratedTerminal"
    -- console = "integratedTerminal";
    -- console = "externalTerminal",
  },
  {
    type = "pwa-node";
    request = "launch",
    name = "Launch file with arguments";
    program = "${file}";
    args = function()
            local args_string = vim.fn.input('Arguments: ')
            return vim.split(args_string, " +")
          end;
    skipFiles = {
      "${workspaceFolder}/node_modules/**/*.js",
      "${workspaceFolder}\\node_modules\\**\\*.js",
      "<node_internals>/**/*.js",
      "<node_internals>\\**\\*.js",
      "<node_internals>/**",
      "node_modules/**"
    },
    sourceMaps = true;
    cwd = "${workspaceFolder}";
    console = "integratedTerminal"
  },
  {
    type = "pwa-node",
    request = "attach",
    name = "Attach",
    justMyCode = false,
    sourceMaps = true,
    processId = require 'dap.utils'.pick_process,
    cwd = "${workspaceFolder}",
    console = "integratedTerminal",
    skipFiles = {
      "${workspaceFolder}/node_modules/**/*.js",
      "${workspaceFolder}\\node_modules\\**\\*.js",
      "<node_internals>/**/*.js",
      "<node_internals>\\**\\*.js",
      "<node_internals>/**",
      "node_modules/**"
    }
  },
  {
    type = "pwa-chrome",
    request = "launch",
    name = "Start Chrome with \"localhost\"",
    justMyCode = false,
    url = "http://localhost:4200",
    sourceMaps = true,
    webRoot = "${workspaceFolder}",
    userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
    console = "integratedTerminal",
    skipFiles = {
      "${workspaceFolder}/node_modules/**/*.js",
      "${workspaceFolder}\\node_modules\\**\\*.js",
      "<node_internals>/**/*.js",
      "<node_internals>\\**\\*.js",
      "<node_internals>/**",
      "node_modules/**"
    }
  }
}

--
-- https://www.npmjs.com/package/ts-node
--https://github.com/mfussenegger/nvim-dap/discussions/659
--npm install ts-node
dap.configurations.typescript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    runtimeArgs = {
      "-r",
      "ts-node/register",
    },
    -- sourceMaps = true,
    cwd = "${workspaceFolder}",
    console = "integratedTerminal",
    skipFiles = {
      "${workspaceFolder}/node_modules/**/*.js",
      "${workspaceFolder}\\node_modules\\**\\*.js",
      "<node_internals>/**/*.js",
      "<node_internals>\\**\\*.js",
      "<node_internals>/**",
      "node_modules/**"
    }
    -- console = "integratedTerminal";
    -- console = "externalTerminal",
  },
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file ESM",
    program = "${file}",
    runtimeArgs = {
      "--loader",
      "ts-node/esm"
    },
    -- sourceMaps = true,
    cwd = "${workspaceFolder}",
    console = "integratedTerminal",
    skipFiles = {
      "${workspaceFolder}/node_modules/**/*.js",
      "${workspaceFolder}\\node_modules\\**\\*.js",
      "<node_internals>/**/*.js",
      "<node_internals>\\**\\*.js",
      "<node_internals>/**",
      "node_modules/**"
    }
    -- console = "integratedTerminal";
    -- console = "externalTerminal",
  },
  {
    type = "pwa-node",
    request = "attach",
    name = "Attach",
    sourceMaps = true,
    processId = require 'dap.utils'.pick_process,
    cwd = "${workspaceFolder}",
    console = "integratedTerminal",
    skipFiles = {
      "${workspaceFolder}/node_modules/**/*.js",
      "${workspaceFolder}\\node_modules\\**\\*.js",
      "<node_internals>/**/*.js",
      "<node_internals>\\**\\*.js",
      "<node_internals>/**",
      "node_modules/**"
    }
  },
  {
    type = "pwa-chrome",
    request = "launch",
    name = "Start Chrome with \"localhost\"",
    runtimeArgs = {
      "-r",
      "ts-node/register"
    },
    url = "http://localhost:4200",
    sourceMaps = true,
    webRoot = "${workspaceFolder}",
    userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
    console = "integratedTerminal",
    skipFiles = {
      "${workspaceFolder}/node_modules/**/*.js",
      "${workspaceFolder}\\node_modules\\**\\*.js",
      "<node_internals>/**/*.js",
      "<node_internals>\\**\\*.js",
      "<node_internals>/**",
      "node_modules/**",
      "${workspaceFolder}/node_modules/**",
    }
  }
}
