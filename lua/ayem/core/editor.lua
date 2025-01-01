local opt = vim.opt

opt.guicursor = 'n-v-c-i:block'

opt.number = true
opt.relativenumber = true

opt.cursorline = true
opt.colorcolumn = '100'

local space = '·'
opt.listchars:append {
    tab = '│─',
    multispace = space,
    lead = space,
    trail = space,
    nbsp = space,
}
