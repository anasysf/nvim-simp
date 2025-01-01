if not pcall(require, 'ayem.lazy.bootstrap') then
    return vim.notify('COULD NOT BOOTSTRAP LAZY', vim.log.levels.ERROR, { title = 'LAZY BOOTSTRAP' })
end

local ok, lazy = pcall(require, 'lazy')
if not ok then
    return vim.notify('COULD NOT LOAD LAZY', vim.log.levels.ERROR, { title = 'LAZY' })
end

lazy.setup {
    spec = {
        -- import your plugins
        { import = 'ayem.lazy.plugins' },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { 'catppuccin' } },
    -- automatically check for plugin updates
    checker = { enabled = true },
}
