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
        variable1 = i(1, "variable1"),
        Column2 = i(1, "column2"),
        variable2 = i(1, "variable2"),
        Column3 = i(1, "column3"),
        variable3 = i(1, "variable3")
    }), {description="Dapper - Create Dynamic parameters"})
});
       
