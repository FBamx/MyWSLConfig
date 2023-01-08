-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed
-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

local setup = function(setup_type, setup_name)
  if setup_type == "d" then
    return ('require("%s").setup()'):format(setup_name)
  elseif setup_type == "c" then
    return ('require("plugins.configs").%s()'):format(setup_name)
  end
end

local init_options = require("plugins.configs").packer_init()
packer.init(init_options)

return packer.startup({
  function(use)
    use { "wbthomason/packer.nvim" }

    --- nvim lua api ---
    use { "folke/neodev.nvim" }

    -- notify
    use { "folke/noice.nvim", config=setup("c", "noice") }
    use { "MunifTanjim/nui.nvim" }
    use { "rcarriga/nvim-notify" }

    --- appearance ---
    use { "ellisonleao/gruvbox.nvim", config=setup("c", "gruvbox") }
    use { "goolord/alpha-nvim", config=setup("c", "alpha") }
    use { "xiyaowong/nvim-transparent", config=setup("c", "transparent") }
    use { "kyazdani42/nvim-web-devicons", config=setup("c", "devicons") }
    use { "tamton-aquib/staline.nvim", config=setup("c", "staline") }
    use { "lewis6991/gitsigns.nvim", config=setup("d", "gitsigns") }

    --- general ---
    use { "nvim-lua/plenary.nvim" }
    use { "cappyzawa/trim.nvim", config=setup("d", "trim") }
    use { "norcalli/nvim-colorizer.lua", config=setup("d", "colorizer") }
    use { "numToStr/Comment.nvim", config=setup("d", "Comment") }
    use { "lukas-reineke/indent-blankline.nvim", config=setup("c", "indent_blankline")  }
    use { "folke/todo-comments.nvim", config=setup("c", "todo_comments") }
    use { "akinsho/bufferline.nvim", tag="v3.*", requires="nvim-tree/nvim-web-devicons", config=setup("c", "bufferline") }
    use { "nvim-treesitter/nvim-treesitter", run=":TSUpdate", config=setup("c", "treesitter") }
    use { "nvim-telescope/telescope.nvim", config=setup("c", "telescope") }
    use { "nvim-telescope/telescope-file-browser.nvim" }

    --- lsp & autocmp ---
    use { "williamboman/mason.nvim", config=setup("d", "mason") }
    use { "williamboman/mason-lspconfig.nvim", config=setup("c", "lspconfig_w_mason") }
    use { "neovim/nvim-lspconfig", config=setup("c", "lspconfig") }

    use { "rafamadriz/friendly-snippets", module={ "cmp", "cmp_nvim_lsp" }, event="InsertEnter" }
    use { "hrsh7th/nvim-cmp", after={"friendly-snippets"}, config=setup("c", "cmp") }
    use { "L3MON4D3/LuaSnip", after="nvim-cmp", config=setup("c", "luasnip") }
    use { "saadparwaiz1/cmp_luasnip", after={"LuaSnip"} }
    use { "hrsh7th/cmp-nvim-lua", after="cmp_luasnip" }
    use { "hrsh7th/cmp-nvim-lsp", after="cmp-nvim-lua" }
    use { "hrsh7th/cmp-buffer", after={"cmp-nvim-lsp"} }
    use { "hrsh7th/cmp-path", after={"cmp-buffer"} }
    use { "windwp/nvim-autopairs", after="nvim-cmp", config=setup("c", "autopairs") }

    -- improve startup time
    use { "lewis6991/impatient.nvim" }

    -- debug
    use { "mfussenegger/nvim-dap", config=setup("c", "dap") }
    use { "rcarriga/nvim-dap-ui", config=setup("c", "dapui")}
    use { "theHamsta/nvim-dap-virtual-text", config=setup("d", "nvim-dap-virtual-text") }

    -- nvim-tree
    use { "nvim-tree/nvim-tree.lua", config=setup("c", "nvim_tree") }

    -- tagbar
    use { "preservim/tagbar" }

    -- hop
    use { "phaazon/hop.nvim", branch="v2", config=setup("c", "hop") }

    -- session manager
    use { "Shatur/neovim-session-manager", config=setup("c", "sessionManager") }

    -- rainbow parentheses
    use { "p00f/nvim-ts-rainbow" }

    -- toggleterm
    use { "akinsho/toggleterm.nvim", tag = '*', config=setup("c", "toggleterm") }

    -- oxocarbon theme
    use { "nyoom-engineering/oxocarbon.nvim" }

    -- refactoring
    use { "ThePrimeagen/refactoring.nvim", config=setup("c", "refactoring") }

    if packer_bootstrap then
      require("packer").sync()
    end

  end
})
