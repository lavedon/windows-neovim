local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

print("Loading HTML snippets....")
ls.add_snippets("html", {
    s("favicon", {
        t('<link href="'),
        i(1, "./custom/images/favicon.png"),
        t('" rel="shortcut icon" type="image/x-icon" />'),
    }),
})

