return {
  -- lazy.nvim
  { 
    "folke/lazy.nvim",
    tag = "stable" 
  },
  -- Themes
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.cmd("colorscheme tokyonight")
    end,
  },
  -- nvim-notify
  {
    "rcarriga/nvim-notify",
    config = function()
      require("plugins.nvim-notify")
    end,
  },
  -- nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    keys = {
      { "<C-e>", "<cmd>lua require('nvim-tree.api').tree.toggle()<CR>", desc = "NvimTree" },
    },
    config = function()
      require("plugins.nvim-tree")
    end,
    event = "VimEnter",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    }
  },
  -- bufferline
  {
    "akinsho/bufferline.nvim",
    lazy = true,
    config = function()
      require("plugins.bufferline")
    end,
    branch = "main",
    event = "User FileOpened",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      "moll/vim-bbye",
    }
  },
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins.lualine")
    end,
    event = "VimEnter",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      "arkav/lualine-lsp-progress"
    }
  },
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    config = function()
      require("plugins.telescope")
    end,
    dependencies = {
      { 
        "nvim-lua/plenary.nvim",
        "LinArcX/telescope-env.nvim"
      },
    },
  },
  -- alpha-nvim
  {
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      require("plugins.alpha")
    end,
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    config = function()
      require("plugins.nvim-treesitter")
    end,
    dependencies = {
      "mrjones2014/nvim-ts-rainbow",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-textsubjects",
      {
        "m-demare/hlargs.nvim",
        disable = true,
        config = function()
          require("hlargs").setup({ color = "#F7768E" })
        end,
      },
    },
  },
  -- LSP
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    servers = nil,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = {
      { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
    },
  },
  -- Formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufNewFile",
    dependencies = { "mason.nvim" },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("plugins.null-ls")
    end,
  },
}

