vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
     "nvim-telescope/telescope-file-browser.nvim",
     requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

  use {
    'kdheepak/tabline.nvim',
    config = function()
        require'tabline'.setup {enable = false}
    end,
    requires = {'hoob3rt/lualine.nvim', 'kyazdani42/nvim-web-devicons'}
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup({
    autosave = {
      enabled = true,
      interval = 60,
      notify = true,
    },
  })
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {'SidOfc/carbon.nvim'}

  use({
    "stevearc/resession.nvim",
    config = function()
      require("resession").setup()
    end,
  })

  use {
    's1n7ax/nvim-window-picker',
    tag = 'v2.*',
    config = function()
        require'window-picker'.setup()
    end,
  }

  use {
      'jedrzejboczar/possession.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
  }

  use {
    "folke/todo-comments.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  }

  use({
  "stevearc/aerial.nvim",
  config = function()
    require("aerial").setup()
  end,
  })
end)
