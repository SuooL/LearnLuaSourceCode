-- 取长度操作符，一元前置符 #，字符串的长度是它的字节数（以一个字符一个字节计算）
print("-----The Length Operator------")
print(#"Lua")

-- 字符串的连接操作符,写作两个点（'..'）
print("-------Concatenation Test------")
print("Hello" .. " Lua !")
print(2333 .. " 哈哈哈")

-- 位操作符

--[[
&: 按位与
|: 按位或
~: 按位异或
>>: 右移
<<: 左移
~: 按位非
]]

-- 所有的位操作都将操作数先转换为整数，然后按位操作，其结果是一个整数。

print("------Bits Operators Test------")
-- 对于右移和左移，均用零来填补空位。 移动的位数若为负，则向反方向位移
print(3<<-1)
print(3>>1) -- 011 --> 001 
print(3<<2) -- 011 --> 01100
-- 若移动的位数的绝对值大于等于整数本身的位数，其结果为零 （所有位都被移出）
print(3>>2) -- 011 --> 000

print(3&1) -- 011 & 001 --> 001
print(3|1) -- 011 | 001 --> 011
print(3~1) -- 011 ~ 001 --> 010
print(~3.0)  -- ~ (+)011  --> (-)100

-- 类型强制转换
-- Lua 对一些类型和值的内部表示会在运行时做一些数学转换-- 称为通常规则。
-- 位操作总是将浮点操作数转换成整数。 
-- 乘方和浮点除法总是将整数转换为浮点数。 
-- 其它数学操作若针对混合操作数（整数和浮点数）将把整数转换为浮点数。

--[[
当操作需要数字时，Lua 还会把字符串转换为数字。
当把一个整数转换为浮点数时,若整数值恰好可以表示为一个浮点数，那就取那个浮点数。 
否则，转换会取最接近的较大值或较小值来表示这个数。这种转换是不会失败的。

将浮点数转为整数的过程会检查 浮点数能否被准确的表达为一个整数,即,浮点数是一个整数值且在整数可以表达的区间。
如果可以，结果就是那个数，否则转换失败。

从字符串到数字的转换过程遵循以下流程:
首先，遵循按 Lua 词法分析器的规则分析语法来转换为对应的整数或浮点数。 （字符串可以有前置或后置的空格以及一个符号。） 
然后，结果数字再按前述规则转换为所需要的类型（浮点或整数）。

从数字转换为字符串使用非指定的人可读的格式。 
若想完全控制数字到字符串的转换过程,可以使用字符串库中的 format 函数。
]]