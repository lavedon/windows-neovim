local ls = require('luasnip')
local s = ls.s
local t = ls.t
local i = ls.i 

print("Loading TypeScript snippets...")
ls.add_snippets("typescript", {
	s("ternary", {
		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
		i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
	})
})

