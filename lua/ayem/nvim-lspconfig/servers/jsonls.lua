local schemas = {
    {
        fileMatch = { 'package.json' },
        url = 'https://json.schemastore.org/package.json',
    },
    {
        fileMatch = {
            'tsconfig.json',
            'tsconfig.*.json',
            'jsconfig.json',
            'jsconfig.*.json',
        },
        url = 'https://json.schemastore.org/tsconfig',
    },
    {
        fileMatch = { '.prettierrc', '.prettierrc.json' },
        url = 'https://json.schemastore.org/prettierrc',
    },
}

return {
    settings = {
        json = {
            schemas = schemas,
            validate = { enable = true },
        },
    },
}
