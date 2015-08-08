local a = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}

print("-----------for Test 1-------------")
for i = 1, #a do
  print(a[i])
end

print("-----------for Test 2-------------")
for i = #a, 1, -2 do
  print(a[i])
end

print("-----------for Test 3-------------")
local pos = nil
for i = 1, #a do
	if a[i] > 9 then
		pos = i
	end
end

print(pos)


--[[
for var = exp1, exp2, exp3 do
  <something>
end
]]
-- 三个表达式 exp1、exp2、exp3 只在循环开始前被求值一次
-- 控制变量 var 是局部变量，不要在循环体外使用它
-- 不要尝试修改控制变量的值，可以用 break 结束循环
