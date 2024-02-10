local ls = require('luasnip')
local s = ls.s
local t = ls.t
local i = ls.i

ls.add_snippets("c", {
    s("hello", {
        t("printf('Hello, World!')")
    })
})

ls.add_snippets("c", {
    s("te", {
        t("typedef enum{"),
        i(1, "Red, Yellow, Blue"),
        t("} "),
        i(2, "Color"),
        t(";")
    })
})
