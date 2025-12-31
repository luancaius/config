return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "pyright" },
      automatic_enable = true,
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)

      vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, {})
      vim.keymap.set({'n'}, '<leader>c', vim.lsp.buf.code_action, {})

      local function setup_server(name, config)
        if vim.lsp and vim.lsp.config then
          vim.lsp.config(name, config)
          if vim.lsp.enable then
            vim.lsp.enable(name)
          end
          return
        end

        -- Fallback for older Neovim: use nvim-lspconfig
        local ok, lspconfig = pcall(require, "lspconfig")
        if ok and lspconfig[name] and lspconfig[name].setup then
          lspconfig[name].setup(config)
        end
      end

      setup_server("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      setup_server("pyright", {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
            },
          },
        },
      })
    end
  },
}
