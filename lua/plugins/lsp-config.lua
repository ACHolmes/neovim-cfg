return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "gopls",
        -- "html", "tsserver" 
        },
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")

      -- Set up Lua language server
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })

      -- Setup rust analyzer / language server 
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities
      })

      -- Setup clangd -> C/C++ language server
      lspconfig.clangd.setup({
        capabilities = capabilities
      })

      -- Setup for go language server 
      lspconfig.gopls.setup({
        capabilities = capabilities
      })

      -- These LSPs require node.js, which I currently don't have installed on linux.
      -- If needed, install node and uncomment here and above.
      -- Setup tsserver for JavaScript langauge server
      -- lspconfig.tsserver.setup({
      --   capabilities = capabilities
      -- })

      -- Setup HTML language server
      -- lspconfig.html.setup({
      --   capabilities = capabilities
      -- })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
