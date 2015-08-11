-- 不返回结果
function funcOne() 
   -- block
end                    
 -- 返回 1 个结果
function functTwo() 
	return "resultFir" 
end        
 -- 返回 2 个结果
function functThree() 
	return "resultFir", "resultSec" 
end   

-- 作为语句调用时，返回的结果全部被忽略
print("---------------Test First-----------------")
functThree()

-- 在表达式中调用时，只保留第一个结果
print("---------------Test Second-----------------")
print("it is: " .. functThree())    -- "it is: resultFir"

-- 只有当一个函数式一系列表达式中的 最后一个 OR 仅有的一个的时候，才能获得其所有的返回值
-- 多重赋值、函数调用的传入的实参列表、表构造 和 return 语句

print("---------------Test Third-----------------")
print("---------------Test  3-1 -----------------")
-- [[ 多重赋值 ]]
-- 唯一的表达式（OK）
x, y = functThree()            -- x="resultFir", y="resultSec"
print("x:" .. x)
print("y:" .. y)
-- 最后一个的表达式（OK）
x, y, z = "Lua", functThree()    -- x="Lua", y="resultFir", c="resultSec"
print("x:" .. x)
print("y:" .. y)
print("z:" .. z)
-- 不满足规定
x, y, z = functThree(), "Lua"    -- x="resultFir", y="Lua", z=nil
print(x, y, z)

print("---------------Test  3-2 -----------------")
-- [[ 函数调用的参数 ]]

-- 唯一的表达式（OK）
print(functThree())              -- 输出：resultFir   resultSec

-- 最后一个的表达式（OK）
print("Lua", functThree())       -- 输出：Lua    resultFir   resultSec

-- 不满足规定
print(functThree(), "Lua")       -- 输出：resultFir    Lua

print("---------------Test  3-3 -----------------")
-- [[ 表构造 ]]

-- 唯一的表达式（OK）
result = {functThree()}              -- result={"resultFir", "resultSec"}
print(table.unpack(result))
-- 最后一个的表达式（OK）
result = {"Lua", functThree()}        -- result={"Lua", "resultFir", "resultSec"}
print(table.unpack(result))
-- 不满足规定
result = {functThree(), "Lua"}        -- result={"resultFir", "Lua"}
print(table.unpack(result))

print("---------------Test  3-4 -----------------")
-- [[ return 语句 ]]

-- 唯一的表达式(0) 最后一个(1) 不满足(2)
function returnMulti( i )
	if i == 0 then return functThree()            -- 返回："resultFir", "resultSec"
	elseif i==1 then return "Lua", functThree()   -- 返回："Lua", "resultFir", "resultSec"
	elseif i==2 then return functThree(), "Lua"   -- 返回："resultFir", "Lua"
	else return (functThree())                    -- 多加一对括号，可以强制只返回一个结果
	end
end

print(returnMulti(0))
print(returnMulti(1))
print(returnMulti(2))
print(returnMulti(3))

-- 调用函数时，多加一对括号，可以强制只返回一个结果
-- return (functThree())

print("--------------Test Unpack----------------")
-- 借助 table.unpack 可以实现：以任何序列（即不存在 nil 的表）作为参数，动态调用任何函数。
local f = string.find
local a = {"hello", "ll"}
print(f(table.unpack(a)))          -- 等价于：string.find("hello", "ll")
