local ls = require('luasnip')
local s = ls.s
local t = ls.t
local i = ls.i 

ls.add_snippets("typescript", {
	s("ternary", {
		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
		i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
	}),
    s("cassert", {
      t("console.assert("), i(1, "variable"), t(".length !== 0, '"), rep(1), t(" is empty.');\n"),
      t("console.assert("), rep(1), t(" !== undefined, '"), rep(1), t(" is undefined.');\n"),
      t("console.assert("), rep(1), t(" !== null, '"), rep(1), t(" is null.');"),
    })
})

