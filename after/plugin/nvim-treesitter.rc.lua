local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
    return vim.notify('COULD NOT LOAD NVIM-TREESITTER [CONFIGS]', vim.log.levels.ERROR, { title = 'NVIM-TREESITTER' })
end

local ensure_installed = {
    'bash',
    'css',
    'editorconfig',
    'gitignore',
    'html',
    'javascript',
    'json',
    'jsonc',
    'lua',
    'markdown',
    'markdown_inline',
    'php',
    'phpdoc',
    'rust',
    'toml',
    'tsx',
    'twig',
    'typescript',
}

configs.setup {
    ensure_installed = ensure_installed,
    sync_install = false,
    auto_install = false,
    highlight = { enable = true },
    indent = { enable = true },
}
