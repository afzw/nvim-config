local packer = require("packer")

packer.startup({
  function(use)
    -- 管理 Packer 自己本身
    use('wbthomason/packer.nvim')
    -- nvim-tree
    use({ 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' })
    -- bufferline
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    -- lualine
    use({ "nvim-lualine/lualine.nvim", requires = { "kyuazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
    -- telescope
    use({ 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } })
    -- telescope extensions
    use('LinArcX/telescope-env.nvim')
    -- dashboard
    use('glepnir/dashboard-nvim')
    -- nvim-treesitter
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    ------------- colorschemes --------------
    -- tokyonight
    use('folke/tokyonight.nvim')
    -- nord
    use('shaunsingh/nord.nvim')
    -- onedark
    use('ful1e5/onedark.nvim')
    ------------------ LSP --------------------
    use('williamboman/mason.nvim')
    -- LSP config
    use('williamboman/mason-lspconfig.nvim')
    -- 补全引擎
    use('hrsh7th/nvim-cmp')
    -- snippet 引擎
    use('hrsh7th/vim-vsnip')
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    -- 常见编程语言代码段
    use('rafamadriz/friendly-snippets')
    use('lukas-reineke/indent-blankline.nvim')
    -- 代码格式化
    use('mhartington/formatter.nvim')
  end,
  config = {
    -- 并发数限制
    max_jobs = 32,
    -- 以浮动窗口打开安装列表
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
  -- 每次保存 plugins.lua 自动安装插:
  pcall(
    vim.cmd,
    [[
      augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerSync
      augroup end
    ]]
  )
})

