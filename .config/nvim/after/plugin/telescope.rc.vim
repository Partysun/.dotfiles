if !exists('g:loaded_telescope') | finish | endif

lua << EOF
function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    file_ignore_patterns = {"node_modules"},
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}
EOF
