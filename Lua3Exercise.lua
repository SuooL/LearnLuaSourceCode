-- Question 1
print("大部分类似 C 语法的语言都不提供 elseif 构造，为什么 Lua 要提供？")

print("                    ")

-- Question 2
print("列出 Lua 中无条件循环（unconditional loop）的 4 种写法。")

-- Question 3
print("很多人争论说 repeat-until 很少使用，因此不应该出现在像 Lua 这种精简化的语言中。你怎么看？")

-- Question 4
print("不使用 goto，重写以下示例中的状态机：")

goto room1    -- 初始房间

::room1:: do
  local move = io.read()
  if move == "south" then goto room3
  elseif move == "east" then goto room2
  else
    print("invalid move")
    goto room1    -- 留在当前房间
  end
end

::room2:: do
  local move = io.read()
  if move == "south" then goto room4
  elseif move == "west" then goto room1
  else
    print("invalid move")
    goto room2    -- 留在当前房间
  end
end

::room3:: do
  local move = io.read()
  if move == "north" then goto room1
  elseif move == "east" then goto room4
  else
    print("invalid move")
    goto room3    -- 留在当前房间
  end
end

::room4:: do
  print("Congratulations, you won!")
end

-- Question 5
print("请解释为什么 Lua 要限制 goto 不能跳出一个函数？（提示：你应该如何正确地跳出一个函数？）")


