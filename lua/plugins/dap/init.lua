return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup({
      icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
      mappings = {
        expand = "<CR>",
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.5 },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks", size = 0.25 },
          },
          position = "left",
          size = 40,
        },
      },
      floating = {
        border = "rounded",
        mappings = { close = { "q", "<Esc>" } },
      },
      windows = { indent = 1 },
      render = { max_type_length = nil, max_value_lines = 50 },
    })

    require("nvim-dap-virtual-text").setup({
      enabled = true,
      enabled_commands = true,
      highlight_changed_variables = true,
      highlight_new_as_changed = false,
      show_stop_reason = true,
      commented = false,
      only_first_definition = true,
      all_references = false,
      clear_on_continue = false,
    })

    -- GDB adapter
    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "-i", "dap" },
    }

    local function get_executable()
      return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
    end

    local function get_args()
      local args_str = vim.fn.input("Arguments (space separated): ")
      return args_str == "" and {} or vim.split(args_str, " ")
    end

    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = get_executable,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
        args = get_args,
        MIMode = "gdb",
        miDebuggerPath = "gdb",
      },
      {
        name = "Launch (no args)",
        type = "gdb",
        request = "launch",
        program = get_executable,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
        args = {},
        MIMode = "gdb",
        miDebuggerPath = "gdb",
      },
    }
    dap.configurations.c = dap.configurations.cpp

    -- Keymaps (grouped under <leader>d)
    vim.keymap.set("n", "<F5>",  dap.continue,      { desc = "Continue" })
    vim.keymap.set("n", "<F10>", dap.step_over,     { desc = "Step over" })
    vim.keymap.set("n", "<F11>", dap.step_into,     { desc = "Step into" })
    vim.keymap.set("n", "<F12>", dap.step_out,      { desc = "Step out" })
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
    vim.keymap.set("n", "<leader>dB", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Conditional breakpoint" })
    vim.keymap.set("n", "<leader>dc", dap.continue,    { desc = "Continue" })
    vim.keymap.set("n", "<leader>dC", dap.disconnect,  { desc = "Disconnect" })
    vim.keymap.set("n", "<leader>dt", dap.terminate,   { desc = "Terminate" })
    vim.keymap.set("n", "<leader>du", dapui.toggle,    { desc = "Toggle DAP UI" })
    vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "Toggle REPL" })
    vim.keymap.set("n", "<leader>dl", dap.run_last,    { desc = "Run last config" })
    vim.keymap.set("n", "<leader>dR", dap.run,         { desc = "Run config (pick)" })

    -- Auto-open / close
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.after.event_stopped["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}
