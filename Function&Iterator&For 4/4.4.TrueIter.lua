-- Lua 中的迭代器其实更像是 “生成器”（generator），它只提供用于迭代的值，而没有执行迭代操作。
-- Lua 中还可以创建另一种迭代器：它会真正执行迭代操作，并在每次迭代中调用一个函数，而这个函数就是迭代器函数的参数。
-- 这种迭代器在老版本的 Lua 中很常用。
-- 结论是：推荐使用 “生成器” 风格的迭代器。

function allwords( f )
	for line in io.lines() do
		for word in string.gmatch(line, "%w+") do
			f(word)
		end
	end
end

allwords(print)

local count = 0
allwords(function (w)
	if w == "hello" then count = count + 1 end
	end)

print(count)


-----------------------
local count = 0
for w in allwords() do
	if w == "hello" then count = count + 1 end
end

print(count)