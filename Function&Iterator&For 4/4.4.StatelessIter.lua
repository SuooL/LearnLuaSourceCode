--[[
无状态的迭代器 是这样一个迭代器：它不保留任何状态，只根据 不变状态 和 控制变量 来产生下一个元素。
因此，我们可以在多个循环中，重复使用同一个无状态的迭代器，从而避免创建新的闭包带来的成本。
]]

a = {"one", "two", "three"}
for i, v in ipairs(a) do
    print(i, v)
end
-- ipairs 就是一个典型的无状态的迭代器，它的 Lua 版本实现如下：

-- 定义迭代器
-- 其中：表 t 作为不变状态，索引 i 作为控制变量
local function iter(t, i)
  i = i + 1
  local v = t[i]
  if v then
    return i, v
  end
end

function ipairs(t)
  return iter, t, 0
end

-- 使用迭代器
t = {"one", "two", "three"}
for i, v in ipairs(t) do
  print(i, v)
end

-- pairs 也是一个无状态的迭代器，只不过它使用的迭代器函数是内置的 next 函数：

-- 定义迭代器
-- 其中：表 t 作为不变状态，表 t 的键作为控制变量（初值为 nil）
function pairs(t)
  return next, t, nil
end

-- 使用迭代器
t = {"one", "two", "three"}
for k, v in pairs(t) do
  print(k, v)
end