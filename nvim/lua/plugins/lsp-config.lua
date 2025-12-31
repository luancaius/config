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
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      vim.lsp.config("pyright", {
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
