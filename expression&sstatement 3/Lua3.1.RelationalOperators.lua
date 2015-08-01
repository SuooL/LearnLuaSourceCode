--[[
==: 等于
~=: 不等于
<: 小于
>: 大于
<=: 小于等于
>=: 大于等于
]]

-- 这些操作的结果不是 false 就是 true。

-- 等于操作(==)先比较操作数的类型.如果类型不同，结果就是 false。否则，继续比较值。
-- 字符串按一般的方式比较。 
-- 数字遵循二元操作的规则：如果两个操作数都是整数，它们按整数比较；否则，它们先转换为浮点数，然后再做比较。
print("-------------Equality Test------------")
print("2" == 2)     -- 类型不一致,等于操作不会将字符串转换为数字，反之亦然。
print("ab" == "aa") -- 字符串的比较
print(1.0 == 1)     -- 数字比较
print(1 == 2)

-- table，userdata, function 以及 thread 都按引用比较： 只有两者引用同一个对象时才认为它们相等。 
-- 每次你创建一个新对象（一张表，一个用户数据，或一个线程），新对象都一定和已有且存在的对象不同。
-- 相同引用的闭包一定相等。 有任何可察觉的差异（不同的行为，不同的定义）一定不等。
print("------Equality Test By Reference-----")
tableOne = {}
tableOne.x = 10
tableOne.y = 20

tableTwo = {}
tableTwo.x = 10
tableTwo.y = 20

tableThree = tableOne

print(tableOne == tableThree)
print(tableOne == tableTwo)

-- ~= 操作完全等价于 (==) 操作的反值。

--[[
大小比较操作以以下方式进行。 
如果参数都是数字， 它们按二元操作的常规进行。 
如果两个参数都是字符串，它们的值按当前的区域设置来比较。 
]]

print("--------Order Operators Test---------")
print(1 > 2) 
print(2 <= 2)      -- 数字比较
print("1" < "2") 
print("1111" < "222")  
print("1" < "a")  -- 字符串的比较
--print("1" < 2)    -- 不能将字符串和数字进行大小的比较 











