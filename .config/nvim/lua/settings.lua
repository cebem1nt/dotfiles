local colors = require("colors.colors")

require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('lualine').setup {
  options = {
    theme = colors.lualine(),
    icons_enabled = true,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {
        'encoding', 
        {
            'filetype',
            colored = true,   -- Displays filetype icon in color if set to true
            icon_only = false, -- Display only an icon for filetype
            icon = { align = 'right' } 
        } -- Display filetype icon on the right hand side
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}


require('mason-lspconfig').setup({
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = { 'pylsp', 'lua_ls', 'rust_analyzer' },
})

-- Highlight extension settings
require("nvim-highlight-colors").setup {
	render = 'background',
	virtual_symbol = '',
	virtual_symbol_prefix = '',
	virtual_symbol_suffix = ' ',
	virtual_symbol_position = 'inline',

	enable_hex = true,
	enable_short_hex = true,
	enable_rgb = true,
	enable_hsl = true,
	enable_var_usage = true,
	enable_named_colors = false,
	enable_tailwind = false,

	custom_colors = {
		{ label = '%-%-theme%-primary%-color', color = '#0f1219' },
		{ label = '%-%-theme%-secondary%-color', color = '#5a5d64' },
	},

    exclude_filetypes = {},
    exclude_buftypes = {},
    exclude_buffer = function(bufnr) end
}

-- Customized on_attach function
-- See `:help vim.diagnostic.*` for documentation on any of the below functions

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer

-- Configure each language
-- How to add LSP for a specific language?
-- 1. use `:Mason` to install corresponding LSP
-- 2. add configuration below

require('lspconfig').pylsp.setup({
	on_attach = function( _, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition,  bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references,  bufopts)

        vim.keymap.set('n', 'K',         vim.lsp.buf.hover,                   bufopts)
        vim.keymap.set('n', 'gi',        vim.lsp.buf.implementation,          bufopts)
        vim.keymap.set('n', '<C-k>',     vim.lsp.buf.signature_help,          bufopts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder,    bufopts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename,                  bufopts)
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action,             bufopts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition,          bufopts)
        
        vim.keymap.set("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
        end, bufopts)

        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
    end,

    settings = {
        pylsp = { plugins = {
                  pycodestyle = {
                  ignore = {'E305', 'E302', 'W291', 'E265', 'E203', 
                            'E501', 'E241', 'W293', 'W292', 'E401',
                            'E231', 'E303', 'E202', 'E201', 'E741',
                            'E128', 'E226' },
                  maxLineLength = 100
            }
          }
        }
      }
})

