local M = {}

local actions = require('dtsf.plugins.configs.telescope.vars').actions
local action_state = require('dtsf.plugins.configs.telescope.vars').action_state
local action_layout = require('dtsf.plugins.configs.telescope.vars').action_layout

local set_prompt_to_entry_value = function(prompt_bufnr)
  local entry = action_state.get_selected_entry()
  if not entry or not type(entry) == 'table' then
    return
  end

  action_state.get_current_picker(prompt_bufnr):reset_prompt(entry.ordinal)
end

M.mappings = {
  i = {
    ['<C-x>'] = false,
    ['<C-c>'] = function()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, true, true), 'n', true)
    end,
    ['<C-j>'] = actions.move_selection_next,
    ['<C-k>'] = actions.move_selection_previous,
    ['<C-d>'] = actions.results_scrolling_down,
    ['<C-u>'] = actions.results_scrolling_up,
    ['<C-l>'] = set_prompt_to_entry_value,
    ['<C-p>'] = action_layout.toggle_preview,
    ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
    ['<C-g>a'] = actions.select_all,
    ['<C-g>s'] = actions.add_selection,
  },
  n = {
    ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
    ['<C-d>'] = actions.results_scrolling_down,
    ['<C-u>'] = actions.results_scrolling_up,
  },
}

return M