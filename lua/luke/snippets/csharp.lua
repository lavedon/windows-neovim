local ls = require('luasnip')
local s = ls.s
local t = ls.t
local i = ls.i
local c = ls.c

-- LuaSnip snippet for basic C# interface
ls.snippets = {
  csharp = {
    s("basic_interface", {
      t({"namespace "}), i(1, "myApp"), t({ "",
      " {",
      "\tpublic interface "}), i(2, "InterfaceName"), t({ "",
      "\t{",
      "\t\t
      t({"",
      "\t\t"}), c(3, {t("char"), t("int"), t("string")}), t(" "), i(4, "VideoEmbedHash"), t("{ get; set;"),
      t({"",
      "\t}",
      "}"
      }),
    }),
  },
}
