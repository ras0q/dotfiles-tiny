-- LSP: nvim-lspconfig
-- LSP Manager: mason.nvim

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  event = "VeryLazy",
  config = function()
    require("mason").setup({
      ui = { border = "single" }
    })
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
      ensure_installed = { "lua_ls", "bashls", "gopls", "jsonls" }
    })
    mason_lspconfig.setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({})
      end,
    })
  end
}
