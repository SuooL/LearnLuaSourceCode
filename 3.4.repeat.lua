-- repeat-until
-- 一条 repeat-until 语句重复执行其循环体直到条件为真结束，先循环再检测条件

-- 同时声明在循环体的变量的作用域包含其条件测试语句
local l = 4
repeat
	l = (l + 1)
	local u = l ^2
	print(u)
until u > 100