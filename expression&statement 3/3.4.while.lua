-- while
--[[
Lua 先测试 While 的条件，如果为假，则循环结束
]]

local a = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
local i = 1

while a[i] do
  print(a[i])
  i = i + 1
end