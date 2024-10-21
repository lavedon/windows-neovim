local ls = require('luasnip')
local s = ls.s
local t = ls.t
local i = ls.i 

print("Loading typescript snippets.")
ls.add_snippets("typescript", {
    s("atleastOne", fmt([[
    const atLeastOneMatch = {}.some(obj1 =>
        {}.some(obj2 => obj1.{} === obj2.{}));
    console.assert(atLeastOneMatch === true, 'there was not atLeastOneMatch');
    console.warn('any matches between {} and {}');
    console.warn(atLeastOneMatch);
    ]], {
        i(1, "collection1"),
        i(2, "collection2"),
        i(3, "col1.obj.property"),
        i(4, "col2.obj.matchProperty"),
        rep(1),
        rep(2)
    })),
	s("ternary", {
		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
		i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
	}),
    s("cdir", fmt([[
    console.assert({}.length !== 0, '{} is empty.');
    console.assert({} !== undefined, '{} is undefined.');
    console.assert({} !== null, '{} is null.');
    console.log('{} is ...');
    console.dir({});
        ]], {
            i(1, "variable"),
            rep(1),
            rep(1),
            rep(1),
            rep(1),
            rep(1),
            rep(1),
            rep(1)
    })),
    s("cassert", fmt([[
    console.assert({}.length !== 0, '{} is empty.');
    console.assert({} !== undefined, '{} is undefined.');
    console.assert({} !== null, '{} is null.');
        ]], {
            i(1, "variable"),
            rep(1),
            rep(1),
            rep(1),
            rep(1),
            rep(1)
    })),
    s("dir", fmt([[
    console.log('{} is ...');
    console.dir({});
    ]], {
        i(1, "variable"),
        rep(1)
    })),
    s("caevery", fmt([[
        console.assert(
           {}.every(x => x.{} && x.{} !== ''),
        'Not every item has a non-empty {}.'
        );
    ]], {
        i(1, "object"),
        i(2, "property"),
        rep(2),
        rep(2)
    })),
    s("isn", fmt([[
        console.assert(typeof {} === 'number', '{} is not a number');
        console.assert({}.length > 0, '{} is not greater than 0');
    ]], {
        i(1, 'property'),
        rep(1),
        rep(1),
        rep(1)
    }))
});
print("Typescript snippets loaded.");

