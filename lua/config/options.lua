-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.textwidth = 80 -- Максимальная ширина строки
opt.colorcolumn = "80" -- Подсветка колонки

-- Базовые настройки редактора
opt.number = true
opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.mouse = "a"
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.splitright = true
opt.splitbelow = true
opt.updatetime = 250
opt.timeoutlen = 300
