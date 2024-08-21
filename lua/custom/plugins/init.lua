-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.g.have_nerd_font = true
vim.opt.relativenumber = true
vim.keymap.set('n', '<leader>fs', vim.cmd.w, { desc = '[F]ile [S]ave' })

-- Enlable spell checker
vim.opt.spell = true

-- Paste replace visual selection without copying it.
vim.keymap.set('v', 'p', '"_dP')

-- Remap ";" to ":"
vim.keymap.set('n', ';', ':')

-- Move text up and down
vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('x', '<A-j>', ":move '>+1<CR>gv-gv")
vim.keymap.set('x', '<A-k>', ":move '<-2<CR>gv-gv")

-- Add syntax highlight to .env files
vim.api.nvim_create_autocmd('BufRead', {
  callback = function()
    vim.filetype.add {
      filename = {
        ['.env'] = 'sh',
      },
    }
  end,
})

return {
  {
    'vim-test/vim-test',
    config = function()
      vim.keymap.set('n', '<Leader>tn', ':TestNearest<CR>')
      vim.keymap.set('n', '<Leader>tf', ':TestFile<CR>')
      vim.keymap.set('n', '<Leader>ts', ':TestSuite<CR>')
      vim.keymap.set('n', '<Leader>tl', ':TestLast<CR>')
      vim.keymap.set('n', '<Leader>tv', ':TestVisit<CR>')
    end,
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        styles = {
          italic = false,
          bold = false,
          transparency = true,
        },
        enable = {
          migrations = true,
        },
      }

      vim.cmd 'colorscheme rose-pine'
    end,
  },

  {
    'github/copilot.vim',
    setup = function()
      vim.g.copilot_assume_mapped = true
    end,
  },

  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  -- {
  --   'supermaven-inc/supermaven-nvim',
  --   config = function()
  --     require('supermaven-nvim').setup {}
  --   end,
  -- },

  -- {
  --   'jackMort/ChatGPT.nvim',
  --   event = 'VeryLazy',
  --   config = function()
  --     require('chatgpt').setup {
  --       api_key_cmd = "op read 'op://Private/ChatGPT.nvim/api key' --no-newline",
  --     }
  --   end,
  --   dependencies = {
  --     'MunifTanjim/nui.nvim',
  --     'nvim-lua/plenary.nvim',
  --     'nvim-telescope/telescope.nvim',
  --   },
  -- },
}
