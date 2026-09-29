return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  -- only load this plugin when one of these filetypes opens
  ft = { "c", "cpp", "ts", "tsx", "js", "jsx", "html", "css", "json", "go", "lua"},
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "clangd",
        "vtsls",
        "html",
        "cssls",
        "gopls",
      },
      automatic_installation = true,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- === c / c++ ===
    vim.lsp.config("clangd", {
      capabilities = capabilities,
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy=false",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "-j=2",                    -- was 4; reduce cpu + ram on 4gb box
        "--malloc-trim",
        "--pch-storage=disk",
        "--limit-results=100",
      },
    })

    -- === typescript / javascript (vtsls) ===
    vim.lsp.config("vtsls", {
      capabilities = capabilities,
      settings = {
        typescript = {
          -- cap tsserver memory; without this it can grow unbounded
          tsserver = { maxtsservermemory = 1024 },
        },
        javascript = {
          tsserver = { maxtsservermemory = 1024 },
        },
      },
    })

    vim.lsp.config("gopls", {
        capabilities = capabilities,
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                },
                staticcheck = true,
                gofumpt = true,
            },
        },
    })

    -- === lua ===
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- This is the important part: stop it from loading everything upfront
            preloadFileSize = 1000, -- skip files larger than 1MB
            maxPreload = 1000,      -- only preload 1000 files max
            checkThirdParty = false,
            -- Keep this so it can still find your Neovim API, but it won't be eager
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = { enable = false },
        },
      },
    })

    vim.lsp.config("html",    { capabilities = capabilities })
    vim.lsp.config("cssls",   { capabilities = capabilities })

    vim.lsp.enable({ "clangd", "vtsls", "html", "cssls", "gopls" })

    -- better diagnostics display
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
        spacing = 4,
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "  ", -- Removed trailing space
          [vim.diagnostic.severity.WARN] = "  ",  -- Removed trailing space
          [vim.diagnostic.severity.INFO] = "  ",  -- Removed trailing space
          [vim.diagnostic.severity.HINT] = "  ",  -- Removed trailing space
        },
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })


    -- lsp keymaps
    vim.api.nvim_create_autocmd("lspattach", {
      callback = function(args)
        local opts = { buffer = args.buf, silent = true }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
      end,
    })
  end,
}
