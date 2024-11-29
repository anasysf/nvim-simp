local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
    return vim.notify('COULD NOT LOAD LSPCONFIG', vim.log.levels.ERROR, { title = 'LSPCONFIG' })
end

local mlsp_ok, mlsp = pcall(require, 'mason-lspconfig')
if not mlsp_ok then
    return vim.notify('COULD NOT LOAD MASON-LSPCONFIG', vim.log.levels.ERROR, { title = 'MASON-LSPCONFIG' })
end

local ensure_installed = {
    'html',
    'intelephense',
    'jsonls',
    'lua_ls',
    'rust_analyzer',
    'tailwindcss',
    'taplo',
    'ts_ls',
    'twiggy_language_server',
}

mlsp.setup { ensure_installed = ensure_installed }

local function on_attach(_, bufnr)
    local keymap = vim.keymap

    local nnoremap = function(keys, fn, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end
        keymap.set('n', keys, fn, { buffer = bufnr, noremap = true, desc = desc })
    end

    nnoremap('gd', vim.lsp.buf.definition, '[G]oto [d]efinition')
    nnoremap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

    for _, method in ipairs { 'textDocument/diagnostic', 'workspace/diagnostic' } do
        local default_diagnostic_handler = vim.lsp.handlers[method]
        vim.lsp.handlers[method] = function(err, result, context, config)
            if err ~= nil and err.code == -32802 then
                return
            end
            return default_diagnostic_handler(err, result, context, config)
        end
    end
end

local function setup()
    local server_opts = { on_attach = on_attach }

    for _, server in pairs(ensure_installed) do
        local server_ok, server_name = pcall(require, 'ayem.lspconfig.servers.' .. server)
        if server_ok then
            server_opts = vim.tbl_deep_extend('force', server_name, server_opts)
        end

        lspconfig[server].setup(server_opts)
    end
end

mlsp.setup_handlers { setup }
