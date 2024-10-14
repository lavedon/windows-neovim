local ls = require('luasnip')
local s = ls.s
local t = ls.t
local i = ls.i

print("Loading lua snippets")
ls.add_snippets("lua", {
    s("hello", {
        t("print('Hello, World!')")
    })
})
print("lua snippets loaded.")

