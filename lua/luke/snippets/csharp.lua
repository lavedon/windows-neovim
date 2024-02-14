local ls = require('luasnip')
-- import the fmt function
local fmt = require("luasnip.extras.fmt").fmt

local s = ls.s
local t = ls.t
local i = ls.i

print("Loading C# snippets...")
ls.add_snippets("cs", {
    s("dapperDynamicParams", fmt([[
        var parameters = new DynamicParameters();
        parameters.Add("@{Column1}, {variable1});
        parameters.Add("@{Column2}, {variable2});
        parameters.Add("@{Column3}, {variable3});
    ]], {
        Column1 = i(1, "column1"),
        Variable1 = i(1, "variable1"),
        Column2 = i(1, "column2"),
        Variable2 = i(1, "variable1"),
        Column3 = i(1, "column3"),
        Variable2 = i(1, "variable1")
    }), {description="Dapper - Create Dynamic parameters"})
});
       
