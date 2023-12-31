local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

plugins = require('plugins')
require('lazy').setup(plugins)

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        local script_path = vim.fn.expand('~/.config/nvim/target/debug/nvim')
        local handle = io.popen(script_path)
        local result = handle:read("*a")
        handle:close()

        local plugin = "Neovim Config Updater"

        if result:match("not up to date") then
            vim.notify("Your Neovim configuration is not up to date!", "error", {
              title = plugin
            })
        else
            vim.notify("Your Neovim configuration is up to date.", "info", {
              title = plugin
            })
        end
    end
})

-- LSP
require'configs.lsp.lsp'

-- Treesitter
require'configs.lsp.treesitter'

-- Appearance
require'configs.appearance.alpha'
require'configs.appearance.lightline'
require'configs.appearance.lualine'
require'configs.appearance.transparent'
require'configs.appearance.colorizer'
require'configs.appearance.indent'
require'configs.appearance.noice'

-- Theme
require'configs.appearance.theme.nord'

-- Navigation
require'configs.navigation.nvim-tree'

-- Integrations
--require'configs.integrations.presence'

-- Utilities
require'configs.utils.autotag'

-- Keymappings
vim.g.mapleader = " "
require'maps'

-- Settings
require'settings'
