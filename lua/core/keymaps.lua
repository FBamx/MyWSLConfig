local map = vim.keymap.set

vim.g.mapleader = " "

-- unset highlight
map("n", "<Esc>", ":nohl<CR>")

-- escape the insert mode
map("i", "jj", "<Esc>")

-- save
map("n", "<C-s>", ":w<CR>")

-- copy all
map("n", "<C-c>", ":%y+<CR>")


-- navigate within insert mode
map("i", "<C-h>", "<Left>")
map("i", "<C-l>", "<Right>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")

-- switch between windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- move quickly
map("n", "<S-j>", "5j")
map("n", "<S-k>", "5k")

map("n", "x", '"_x')
map("n", "=", "<C-a>")
map("n", "-", "<C-x>")

map("n", "<C-a>", "ggVG", { silent = true })

map("i", "<M-z>", "<ESC>", { silent = true })

map("n", "<leader>nh", ":nohl<CR>", { silent = true })
map("n", "<leader>x", ":bdelete!<CR>", { silent = true })

map("n", "<TAB>"    , ":BufferLineCycleNext<CR>", { silent = true })
map("n", "<S-TAB>"  , ":BufferLineCyclePrev<CR>", { silent = true })
map("n", "<leader><Left>", ":BufferLineMovePrev<CR>", { silent = true })
map("n", "<leader><Right>", ":BufferLineMoveNext<CR>", { silent = true })

map("n", "<leader>/", ":lua require('Comment.api').toggle.linewise.current()<CR>")
map("v", "<leader>/", ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

map("n", "gd", vim.lsp.buf.definition)
map("n", "gD", vim.lsp.buf.declaration)
map("n", "gr", vim.lsp.buf.references)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "<C-k>", vim.lsp.buf.signature_help)
map("n", "<leader>ra", vim.lsp.buf.rename)
map("n", "<leader>d", vim.diagnostic.open_float)
map("n", "<M-n>", vim.diagnostic.goto_next)
map("n", "<M-p>", vim.diagnostic.goto_prev)

map("n", "<leader>fb", ":Telescope file_browser<CR>", { silent = true })
map("n", "<leader>ft", ":TodoTelescope<CR>", { silent = true })
map("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
map("n", "<leader>fw", ":Telescope live_grep<CR>", { silent = true })
map("n", "<leader>fs", ":Telescope grep_string<CR>", { silent = true })

-- dap
map("n", "<F1>", ":lua require 'dap'.toggle_breakpoint()<CR>")
map("n", "<F2>", ":lua require 'dap'.continue()<CR>")
map("n", "<F3>", ":lua require 'dap'.step_over()<CR>")
map("n", "<F4>", ":lua require 'dap'.step_into()<CR>")
map("n", "<F5>", ":lua require 'dap'.step_out()<CR>")
map("n", "<F6>", ":lua require 'dapui'.close()<CR>")

-- nvim-tree
map("n", "<C-n>", ":NvimTreeToggle<CR>")

-- tagbar
map("n", "<A-t>", ":Tagbar<CR>")

-- hop
map("n", "<leader><leader>", ":HopChar1<CR>")

-- buffer
map("n", "<leader>x", ":lua require 'plugins.configs'.closeBuffer()<CR>")
