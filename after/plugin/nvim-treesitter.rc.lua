local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
    return vim.notify(
        'COULD NOT LOAD NVIM-TREESITTER [CONFIGS]',
        vim.log.levels.ERROR,
        { title = 'NVIM-TREESITTER [CONFIGS]' }
    )
end

local ensure_installed = {
    'gitignore',
    'lua',
    'luadoc',
    'markdown',
    'markdown_inline',
    'tmux',
    'toml',
    'vimdoc',
}

configs.setup {
    ensure_installed = ensure_installed,
    sync_install = false,
    auto_install = false,
    highlight = { enable = true },
    indent = { enable = true },
}
