--[[
The logical operators in Lua are and, or, and not.
all logical operators consider both false and nil as false and anything else as true.
]]

-- 取反操作 not 总是返回 false 或 true 中的一个。
print("----------not Test----------")
print(not nil)
print(not 0)
print(not "lua")
print(not false)
print(not not nil)  -- 多重 not

-- 与操作符在第一个参数为 false 或 nil 时返回第一个参数,否则返回第二个参数
print("----------and Test----------")
print(4 and 5)       --> 5
print(nil and 5)     --> nil
print(false and 5)   --> false

-- 或操作符 or 在第一个参数为真时返回这第一个参数，否则返回第二个
print("----------or Test-----------")
print(4 or 5)        --> 4
print(nil or 5)      --> 5
print(nil or false)  --> false

-- and 和 or 都遵循短路规则；即是第二个操作数只在需要的时候去求值。
print("---short-circuit evaluation---")

--[[
x = x or y
等价于,在对 x 的值没有设置的时候设置一个默认值
if not x then
	x = y
end
]]

--[[
(a and b) or c
类似于 C语言的三目操作符 a?b:c
]]
max = (2 > 3) and 2 or 3
print(max)

