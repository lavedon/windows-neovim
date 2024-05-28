local ls = require('luasnip')
local fmt = require("luasnip.extras.fmt").fmt

local s = ls.s
local t = ls.t
local i = ls.i

print("Loading SQL snippets...")
ls.add_snippets("sql", {
    s("setup", {
        t({"SET ANSI_NULLS ON", "GO", "SET QUOTED_IDENTIFIER ON", "GO", ""}),
    }),
    s("whichServer", fmt([[ 
          DECLARE @machinename VARCHAR(100);
          SET @machinename = CONVERT(VARCHAR(100), SERVERPROPERTY('machinename')); 

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
       })),
   s("mergeInsertOnNoMatch", fmt([[
        MERGE INTO {TargetTable} AS target
        USING {SourceTable} AS source
        ON target.{KeyColumn} = source.{KeyColumn}
        WHEN MATCHED THEN
            UPDATE SET target.{Column1} = source.{Column1},
                       target.{Column2} = source.{Column2}
        WHEN NOT MATCHED BY TARGET THEN
            INSERT ({KeyColumn}, {Column1}, {Column2})
            VALUES (source.{KeyColumn}, source.{Column1}, source.{Column2});
   ]], {
       TargetTable = i(1, "TargetTable"),
       SourceTable = i(2, "SourceTable"),
       KeyColumn   = i(3, "KeyColumn"),
       Column1     = i(4, "Column1"),
       Column2     = i(5, "Column2")
   }), {description="Merge Insert on No Match"})
});
