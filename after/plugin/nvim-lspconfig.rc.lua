local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
    return vim.notify('COULD NOT LOAD NVIM-LSPCONFIG', vim.log.levels.ERROR, { title = 'NVIM-LSPCONFIG' })
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_ok then
    return vim.notify('COULD NOT LOAD MASON-LSPCONFIG', vim.log.levels.ERROR, { title = 'MASON-LSPCONFIG' })
end

local ensure_installed = {
    'css_variables',
    'cssls',
    'cssmodules_ls',
    'html',
    'lua_ls',
    'ts_ls',
}

mason_lspconfig.setup { ensure_installed = ensure_installed }

local keymap = vim.keymap

local function on_attach(_, bufnr)
    --- @type vim.keymap.set.Opts
    local opts = { silent = true, buffer = bufnr }

    keymap.set('n', '<leader>dm', vim.diagnostic.open_float, opts)
    keymap.set('n', 'gp', vim.diagnostic.goto_prev, opts)
    keymap.set('n', 'gn', vim.diagnostic.goto_next, opts)
    keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
end

local server_opts = { on_attach = on_attach }

local function setup()
    for _, server in pairs(ensure_installed) do
        local server_ok, server_name = pcall(require, 'ayem.nvim-lspconfig.servers.' .. server)
        if server_ok then
            server_opts = vim.tbl_deep_extend('force', server_name, server_opts)
        end

        lspconfig[server].setup(server_opts)
    end
end

mason_lspconfig.setup_handlers { setup }
