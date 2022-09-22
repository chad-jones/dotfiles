-- space as leader
vim.g.mapleader = ','

-- toggle tree
vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeToggle<cr>', {desc = 'NvimTreeToggle'})

-- which key?
vim.keymap.set('n', '<leader>k', '<cmd>WhichKey<cr>', {desc = 'WhichKey'})

-- remap esc
vim.keymap.set('i', 'jj', '<Esc>', {remap = true})

-- tab management
vim.keymap.set('n', '<leader>1', '1gt', {remap=false})
vim.keymap.set('n', '<leader>2', '2gt', {remap=false})
vim.keymap.set('n', '<leader>3', '3gt', {remap=false})
vim.keymap.set('n', '<leader>4', '4gt', {remap=false})
vim.keymap.set('n', '<leader>5', '5gt', {remap=false})
vim.keymap.set('n', '<leader>6', '6gt', {remap=false})
vim.keymap.set('n', '<leader>7', '7gt', {remap=false})
vim.keymap.set('n', '<leader>8', '8gt', {remap=false})
vim.keymap.set('n', '<leader>9', '9gt', {remap=false})
vim.keymap.set('n', '<leader>0', '0gt', {remap=false})
vim.keymap.set('n', '<leader>tn', ':tabnew<cr>')
vim.keymap.set('n', '<leader>to', ':tabonly<cr>')
vim.keymap.set('n', '<leader>tc', ':tabclose<cr>')
vim.keymap.set('n', '<leader>tm', ':tabmove')
vim.keymap.set('n', '<leader>th', ':tabprevous<CR>')
vim.keymap.set('n', '<leader>tl', ':tabnext<CR>')
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>')

-- Switch CWD to the directory of the open buffer
vim.keymap.set('n', '<leader>d', ':cd %:p:h<cr>:pwd<cr>')

-- move
local opts = { noremap = true, silent = true }

vim.keymap.set('n', '∆', ':MoveLine(1)<CR>', opts) -- <A-j>
vim.keymap.set('n', '˚', ':MoveLine(-1)<CR>', opts) -- <A-k>
vim.keymap.set('v', '∆', ':MoveBlock(1)<CR>', opts) -- <A-j.
vim.keymap.set('v', '˚', ':MoveBlock(-1)<CR>', opts) -- <A-k>
vim.keymap.set('n', '˙', ':MoveHChar(-1)<CR>', opts) -- <A-h>
vim.keymap.set('n', '¬', ':MoveHChar(1)<CR>', opts) -- <A-l>
vim.keymap.set('v', '˙', ':MoveHBlock(-1)<CR>', opts) -- <A-h>
vim.keymap.set('v', '¬', ':MoveHBlock(1)<CR>', opts) -- <A-l>

-- telescope
vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fr", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
vim.api.nvim_set_keymap('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
vim.api.nvim_set_keymap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)

-- ctrlsf
vim.api.nvim_set_keymap('n', '<leader>fx', '<Plug>CtrlSFPrompt', {noremap = false, silent = false})

-- hop
vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>", {})
vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>", {})
vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })<cr>", {})
vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })<cr>", {})

-- terminal
vim.api.nvim_set_keymap('n', '<C-/>', "<cmd>lua require('nvterm.terminal').toggle('horizontal')<cr>", opts)
vim.api.nvim_set_keymap('t', '<C-/>', "<cmd>lua require('nvterm.terminal').toggle('horizontal')<cr>", opts)

--[[
### folding ###

zf#j creates a fold from the cursor down # lines.
zf/string creates a fold from the cursor to string.
zj moves the cursor to the next fold.
zk moves the cursor to the previous fold.
zo opens a fold at the cursor.
zO opens all folds at the cursor.
zm increases the foldlevel by one.
zM closes all open folds.
zr decreases the foldlevel by one.
zR decreases the foldlevel to zero — all folds will be open.
zd deletes the fold at the cursor.
zE deletes all folds.
[z move to start of open fold.
]z move to end of open fold. --]]

--[[

### surround ###

    Old text                    Command         New text
--------------------------------------------------------------------------------
    surr*ound_words             ysiw)           (surround_words)
    *make strings               ys$"            "make strings"
    [delete ar*ound me!]        ds]             delete around me!
    remove <b>HTML t*ags</b>    dst             remove HTML tags
    'change quot*es'            cs'"            "change quotes"
    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    delete(functi*on calls)     dsf             function calls
--]]
