local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
    return vim.notify(
        'COULD NOT LOAD NVIM-TREESITTER [CONFIGS]',
        vim.log.levels.ERROR,
        { title = 'NVIM-TREESITTER [CONFIGS]' }
    )
end

local ensure_installed = {
    'css',
    'gitignore',
    'html',
    'javascript',
    'lua',
    'luadoc',
    'markdown',
    'markdown_inline',
<<<<<<< HEAD
    'php',
    'phpdoc',
=======
    'rust',
>>>>>>> 820caac (rust)
    'tmux',
    'toml',
    'twig',
    'vimdoc',
}

configs.setup {
    ensure_installed = ensure_installed,
    sync_install = false,
    auto_install = false,
    highlight = { enable = true },
    indent = { enable = true },
}
