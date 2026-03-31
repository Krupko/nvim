-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
--
vim.keymap.set("n", "<A-j>", ":m .+1<CR>", { desc = "Переместить строку вниз" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>", { desc = "Переместить строку вверх" })

-- PNPM монорепа
vim.keymap.set("n", "<leader>pr", "<cmd>PnpmRoot<CR>", { desc = "PNPM Root" })
vim.keymap.set("n", "<leader>pp", "<cmd>PnpmPackage<CR>", { desc = "Current Package" })
vim.keymap.set("n", "<leader>pi", "<cmd>PnpmInstall<CR>", { desc = "PNPM Install" })
vim.keymap.set("n", "<leader>pu", "<cmd>PnpmUpdate<CR>", { desc = "PNPM Update" })
vim.keymap.set("n", "<leader>pb", "<cmd>PnpmBuild<CR>", { desc = "Build Package" })
vim.keymap.set("n", "<leader>pd", "<cmd>PnpmDev<CR>", { desc = "Dev Package" })
vim.keymap.set("n", "<leader>pt", "<cmd>PnpmTest<CR>", { desc = "Test Package" })
vim.keymap.set("n", "<leader>pl", "<cmd>PnpmLint<CR>", { desc = "Lint Package" })
vim.keymap.set("n", "<leader>tc", "<cmd>TsCheck<CR>", { desc = "TypeScript Check" })

-- Webapp
vim.keymap.set("n", "<leader>wd", "<cmd>WebappDev<CR>", { desc = "Webapp Dev" })
vim.keymap.set("n", "<leader>wb", "<cmd>WebappBuild<CR>", { desc = "Webapp Build" })
vim.keymap.set("n", "<leader>wl", "<cmd>WebappLint<CR>", { desc = "Webapp Lint" })

-- Backend
vim.keymap.set("n", "<leader>bd", "<cmd>BackendDev<CR>", { desc = "Backend Dev" })
vim.keymap.set("n", "<leader>bb", "<cmd>BackendBuild<CR>", { desc = "Backend Build" })
