local ls = require('luasnip')
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.s
local t = ls.t
local i = ls.i
local c = ls.c

ls.add_snippets("sql", {
    ls.parser.parse_snippet("which_server_insert", [[
                SET ANSI_NULLS ON
                GO
                SET QUOTED_IDENTIFIER ON
                GO

                DECLARE @machinename VARCHAR(100);
                SET @machinename = CONVERT(VARCHAR(100), SERVERPROPERTY('MachineName'));

                IF (@machinename = '$1')
                BEGIN
                    IF NOT EXISTS (
                            SELECT * 
                            FROM dbo.WH_AppConfig WITH (NOLOCK)
                            WHERE $2
                    ) 
                    BEGIN
                        INSERT INTO dbo.WH_AppConfig ($3)
                        VALUES ($4);
                    END
                END
            ]]),
        },
    ls.parser.parse_snippet("simple_which_server_insert", [[
                SET ANSI_NULLS ON
                GO
                SET QUOTED_IDENTIFIER ON
                GO

                DECLARE @machinename VARCHAR(100);
                SET @machinename = CONVERT(VARCHAR(100), SERVERPROPERTY('MachineName'));

                IF (@machinename = '$1')
                BEGIN
                        INSERT INTO dbo.WH_AppConfig ($3)
                        VALUES ($4);
                END
            ]])
