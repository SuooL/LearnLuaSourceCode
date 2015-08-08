-- Answer 1
print("因为 Lua 中没有 switch 语句，所以在做多路选择时，经常会用到 elseif。")

-- Answer 2
--[[
写法 1：

while true do
  block
end
写法 2：

repeat
  block
until false
写法 3：

for i = 1, math.huge do
  block
end
写法 4：

::redo:: do
  block
  goto redo
end

]]

-- Answer 3

--[[
repeat-until 跟 C 语言中的 do-while 语句很类似，
对于“要预先执行一次操作，而后再根据条件来判断是否继续”的这类事务，
相比 while 语句而言，repeat-until 可以让代码更简洁一些。
]]

-- Answer 4

local room1 = {}
local room2 = {}
local room3 = {}
local room4 = {}

-- 建造房间 1
room1.east = room2
room1.south = room3
room1.west = room1
room1.north = room1

-- 建造房间 2
room2.east = room2
room2.south = room4
room2.west = room1
room2.north = room2

-- 建造房间 3
room3.east = room4
room3.south = room3
room3.west = room3
room3.north = room1

-- 游戏开始
local room = room1
-- 游戏进行中
repeat
  local current = room
  local move = io.read()
  room = current[move] or current
  if room == current then
    print("invalid move")
  end
until room == room4

-- 游戏结束
print("Congratulations, you won!")

-- Answer 5

print("在 Lua 中，跳出一个函数的正确方式是使用 return 语句。")



