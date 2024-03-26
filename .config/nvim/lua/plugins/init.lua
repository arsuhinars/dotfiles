return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",

        "bash",
        "yaml",
        "json",
        "ini",
        "dockerfile",
        "gitignore",
        "markdown",

        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "vue",

        "c",
        "cpp",
        "rust",
        "cmake",

        "dart",
        "java",
        "python",

        "glsl",
        "wgsl",
        "latex"
      }
    }
  },

  {
    "williamboman/mason.nvim"
  },

  {
    "williamboman/mason-lspconfig.nvim"
  },

  {
    "neovim/nvim-lspconfig"
  }
}
