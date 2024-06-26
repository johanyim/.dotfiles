require("luasnip.session.snippet_collection").clear_snippets("php")


local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt



ls.add_snippets("php", {
    s("echo", fmt("echo \"{}\";{}", { i(1), i(0)})),
})


ls.add_snippets("php", {
    s("php?", fmt("<?php\n\t{}\n?>", { i(1) })),
})
