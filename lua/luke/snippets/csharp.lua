local ls = require('luasnip')
-- Import the fmt function
local fmt = require("luasnip.extras.fmt").fmt

local s = ls.s
local t = ls.t
local i = ls.i

print("Loading C# snippets...")
ls.add_snippets("cs", { -- Make sure this matches your file type
    s("dapperDynamicParams", fmt([[
        var parameters = new DynamicParameters();
        parameters.Add("@{Column1}", {variable1});
        parameters.Add("@{Column2}", {variable2});
        parameters.Add("@{Column3}", {variable3});
    ]], {
        Column1 = i(1, "column1"),
        variable1 = i(2, "variable1"),
        Column2 = i(3, "column2"),
        variable2 = i(4, "variable2"),
        Column3 = i(5, "column3"),
        variable3 = i(6, "variable3")
    }), {description="Dapper - Create Dynamic parameters"}),
    s("allObjectProperties", fmt([[
foreach (var {1} in {2})
{{
   Console.WriteLine("New row...");
   foreach (PropertyInfo prop in {1}.GetType().GetProperties())
   {{
       Console.WriteLine($"{prop.Name}: {prop.GetValue({1})}");
   }}
   Console.WriteLine(); // New line
}}
    ]], {
        i(1, "obj"),
        i(2, "objs"),
    }))
})
