local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.load_extension('fzy_native')
telescope.load_extension('file_browser')
telescope.load_extension('dap')
telescope.load_extension("emoji")

local actions = require "telescope.actions"
local builtin = require("telescope.builtin")
local fb_actions = require "telescope".extensions.file_browser.actions
local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end


-- default ignored patters
local default_ignore = {
  ".git/",
  "cache",
  ".venv/",
  "node_modules/"
}

-- load new values from local file
local current_working_dir = vim.fn.getcwd()
local ignore_file = current_working_dir .. "/.telescopeignore"

local custom_ignore = {}
local f = io.open(ignore_file, "r")

if f then
  for line in f:lines() do
    local remove_space = line:gsub("%s", "")
    if line ~= "" then
      table.insert(custom_ignore, line)
    end
  end
  f:close()
end

local final_ignore = vim.list_extend(default_ignore, custom_ignore)

telescope.setup{
  defaults = {
    layout_strategy = 'vertical',
    layout_config = { 
      height = 0.89, 
      width = 0.89,
      preview_cutoff = 20
    },
    prompt_prefix = " ",
    selection_caret = " ",
    file_ignore_patterns = final_ignore,
    path_display = { "smart" },
    mappings = {
      i = {
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,
        ["<C-c>"] = require('telescope.actions.layout').toggle_preview,
      },
      n = {
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,
        ["<C-c>"] = require('telescope.actions.layout').toggle_preview,
      },
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    },
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      file_ignore_patterns = {},
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  }
}


-- vim.keymap.set("n", "<leader>f", function() cool_input() end, {desc = "Input cwd for telescope"})
vim.keymap.set('n', '<Leader>ff', ':Telescope find_files hidden=true no_ignore=false<cr>', {})
vim.keymap.set('n', '<Leader>fg', ':Telescope live_grep<cr>', {})
vim.keymap.set('n', '<Leader>fb', ':Telescope buffers<cr>', {})
vim.keymap.set('n', '<Leader>fh', ':Telescope help_tags<cr>', {})
vim.keymap.set("n", "<Leader>fd", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "insert",
    layout_config = { height = 40 },
  })
end)
vim.keymap.set("n", "<Leader>fr", function()
  builtin.lsp_references()
end)

vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
-- If you don't want to use the telescope plug-in but still want to see all the errors/warnings, comment out the telescope line and uncomment this:
-- vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })



