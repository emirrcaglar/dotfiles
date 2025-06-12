-- lazy.nvim
return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    -- Other dependencies
    'saifulapm/neotree-file-nesting-config', -- add plugin as dependency. no need any other config or setup call
  },
  opts = {
    -- recommended config for better UI
    hide_root_node = true,
    retain_hidden_root_indent = true,
    filesystem = {
      filtered_items = {
        show_hidden_count = false,
        never_show = {
          '.DS_Store',
        },
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = '',
        expander_expanded = '',
      },
    },
    -- other config
  },
  config = function(_, opts)
    -- Set keymap to toggle Neo-tree
    vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { silent = true, noremap = true })
    vim.keymap.set("n", "<Tab>", ":bnext<CR>")
    vim.keymap.set("n", "<Leader>w", ":br<CR>")
    vim.keymap.set("n", "<S-Tab>", ":bprev<CR>")

    -- Apply Neo-tree setup with the provided options
    require("neo-tree").setup(opts)
  end,
}

