-- 局部变量和块
a = 233        -- 全局变量
local b = 111  -- 局部变量

-- 一个代码块同时也是一个语句块，所以局部变量可以放在代码块中那些显式注明的语句块之外。
print("----------Test-1-----------")
m = 5
local n = 1
while n <= m do
	print(n*2)
	n = n + 1
end

print("----------Test-2-----------")
if n > 5 then
	local m = 2333     -- then 中的局部变量
	print(m)
else
	print(m)
end
print(m)