if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'

if has("nvim")
  Plug 'hoob3rt/lualine.nvim'
  "Plug 'kristijanhusak/defx-git'
  "Plug 'kristijanhusak/defx-icons'
  "Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim6.0' }
  Plug 'folke/lsp-colors.nvim'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

  " -- Language
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'rafamadriz/friendly-snippets'

  " -- Icons
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'ryanoasis/vim-devicons'
  Plug 'onsails/lspkind-nvim'

  " -- Telescope
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  "Plug 'windwp/nvim-autopairs'
  "Plug 'windwp/nvim-ts-autotag'

  " -- Completion
  Plug 'github/copilot.vim'

  " -- General Plugins
  Plug 'tpope/vim-surround'
  Plug 'goolord/alpha-nvim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'terrortylor/nvim-comment'

endif


" Colorscheme
Plug 'folke/tokyonight.nvim'
Plug 'https://github.com/arcticicestudio/nord-vim'

"Plug 'groenewege/vim-less', { 'for': 'less' }
"Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

call plug#end()

