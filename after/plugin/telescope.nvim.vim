lua << EOF
local actions = require("telescope.actions")
require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  }
}

require('telescope').setup{
	defaults = {
     file_ignore_patterns = {"node_modules"},
     sorting_strategy = "ascending",
     layout_config = {
      prompt_position = "top",
      horizontal = {
        width_padding = 0.04,
        height_padding = 0.1,
        preview_width = 0.6,
      },
     vertical = {
        width_padding = 0.05,
        height_padding = 1,
        peview_height = 0.5,
      },
     },
    -- file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    -- generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
  },
	pickers = {
     -- live_grep ={ theme= "dropdown"  },
     -- find_files={ theme= "dropdown"  }
	},
  mappings = {
    i = {
        ["<esc>"] = actions.close,
    },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
      }
    }
  },
}
require('telescope').load_extension('fzf')

local function map(mode, lhs, rhs, opts)
local options = {noremap = true}
if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function telescope_find_word(path)
  local _path = path or vim.fn.input("Dir: ", "", "dir")
  require("telescope.builtin").grep_string({search_dirs = {_path}})
end
map('n', '<leader>fd', ':lua telescope_find_word()<CR>')
EOF

