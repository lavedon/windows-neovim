local ls = require("luasnip")

ls.snippets = {
  typescript = {
    ls.parser.parse_snippet(
      "func",
      "function ${1:functionName}(${2:params}): ${3:returnType} {\n\t${4:body}\n}"
    ),
  },
}
