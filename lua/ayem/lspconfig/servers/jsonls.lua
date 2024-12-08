local schemas = {
    {
        fileMatch = { 'package.json' },
        url = 'https://json.schemastore.org/package.json',
    },
    {
        fileMatch = { '.prettierrc', '.prettierrc.json' },
        url = 'https://json.schemastore.org/package.json',
    },
}

return {
    settings = {
        json = {
            schemas = schemas,
            validate = {
                enable = true,
            },
        },
    },
}
