local present, packer = pcall(require, "Yeahii.plugin.packer_init")

if not present then
  return false
end

local use = packer.use

local conf = function(name)
  return "require('Yeahii.plugin.config." .. name .. "')"
end


-- packer download
--

return require('packer').startup(function(use)
  -- My plugins here
	
	-- packer plugin
	use "wbthomason/packer.nvim"

	-- theme plugin
	use({
			"catppuccin/nvim",
			as = "catppuccin",
			config = conf "theme",
	})
	use "lervag/vimtex"

	--annotation
	  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup {
        mappings = {
          extra = false,
        },
      }
    end,
  }


	-- neo-tree plugin
	use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
		setup = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      vim.keymap.set("n", "<A-1>", "<Cmd>Neotree<CR>")
    end,
    config = conf "neo-tree",
  }
	use 'neovim/nvim-lspconfig'
	use {
    'williamboman/nvim-lsp-installer',
		--config = conf "lsp.setup"
		 config = function ()
      require("Yeahii.plugin.config.lsp.setup")
    end
		--config = function()
		--require "Yeahii"
		--end
	}
	
	use "folke/lua-dev.nvim"

  use {
    "onsails/lspkind-nvim",
  }
  use {
    "hrsh7th/nvim-cmp",
    -- branch = "dev",
    -- commit = "8428166e308b5bad9cfee55f850de8b6a2f2b1ce",
    wants = "lspkind-nvim",
    config = conf "nvim-cmp",
  }

	-- cmp plugin
	use {
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "f3fora/cmp-spell",
    "hrsh7th/cmp-nvim-lsp-signature-help",
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
