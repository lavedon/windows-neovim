local ls = require('luasnip')
local s = ls.s
local t = ls.t
local i = ls.i

ls.add_snippets("lua", {
    s("hello", {
        t("print('Hello, World!')")
    })
})

