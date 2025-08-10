local builtin = require("telescope.builtin")

--INFO: Se usa para poner una tecla principal
--para comandos
-- Mapper
vim.g.mapleader = ","

-- NvimTree
vim.keymap.set("n", "tt", ":NvimTreeToggle<return>")
vim.keymap.set("n", "tr", ":NvimTreeRefresh<return>")
vim.keymap.set("n", "tf", ":NvimTreeFindFile<return>")

--Custom
vim.keymap.set("n", "<ESC>", ":noh<return><ESC>")
vim.keymap.set("n", "}", ":bnext<return>")
vim.keymap.set("n", "¿", ":bprev<return>")

-- Telescope
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>ft", ":TodoTelescope<return>")

-- Terminal
vim.keymap.set("n", "<leader>t", ":ToggleTerm<return>")
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { noremap = true, silent = true })
