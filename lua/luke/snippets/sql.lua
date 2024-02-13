local ls = require('luasnip')
-- import the fmt function
local fmt = require("luasnip.extras.fmt").fmt

local s = ls.s
local t = ls.t
local i = ls.i

ls.add_snippets("sql", {
    s("setup", {
        t({"SET ANSI_NULLS ON", "GO", "SET QUOTED_IDENTIFIER ON", "GO", ""}),
    }),
    s("whichServer", fmt([[ 
          DECLARE @machinename VARCHAR(100);
          SET @machinename = CONVERT(VARCHAR(100), SERVERPROPERTY({ServerName})); 

           IF (@machinename = '{ServerName}'),
           BEGIN
              INSERT INTO {Table} {Columns} VALUES ({Values}); 
           END
       END
   ]], {
        ServerName = i(1, "ServerName"),
        Table = i(2, "Table"),
        Columns = i(3, "Columns"),
        Values = i(4, "Values")
       }))
});
