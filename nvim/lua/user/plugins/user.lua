return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    lazy = false,
    config = function()
      require("copilot").setup {
        copilot_proxy_strict_ssl = false,
      }
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    lazy = false,
    run = "cd app && yarn install",
  },
}
