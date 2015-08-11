-- 一个简单的值迭代器
function values(t)
  local i = 0    -- 非局部变量（non-local variables）
  return function()
    i = i + 1
    return t[i]
  end
end

-- 普通的 while 循环
local t = {10, 20, 30}
local iter = values(t)      -- 创建迭代器
while true do
  local element = iter()    -- 调用迭代器
  if element == nil then    -- 如果迭代器返回 nil，则停止循环
    break
  end
  print(element)
end

-- 为迭代而生的泛型 for 循环
-- 功能等价（为你包办了上面 while 循环中需要处理的各种杂事）
local t = {10, 20, 30}
for element in values(t) do
  print(element)
end

-- 泛型 for 的语法如下：
--[[
for <var-list> in <exp-list> do
  <body>
end
]]
-- 其中，var-list 是逗号分隔的变量列表，exp-list 是逗号分隔的表达式列表。
-- 变量列表中的第一个变量称为 控制变量（control variable），一旦它的值为 nil，就会停止循环。

--[[
实际上，泛型 for 保存了三个值：迭代器函数、不变状态（invariant state）、控制变量。执行 for 语句会经历以下步骤：

1.求值表达式列表，以得到三个值：迭代器函数、不变状态、控制变量的初值（赋值规则类似 多重赋值）
2.以不变状态、控制变量为参数，调用迭代器函数
3.得到迭代器函数的返回值，并赋给变量列表中的变量
4.如果控制变量为 nil，则停止循环；否则执行循环体，然后重复第 2 步
]]

function allwords ()
  local line = io.read()  -- current line
  local pos = 1           -- current position in the line
  return function ()      -- iterator function
    while line do         -- repeat while there are lines
      local s, e = string.find(line, "%w+", pos)
      if s then           -- found a word?
        pos = e + 1       -- next position is after this word
        return string.sub(line, s, e)     -- return the word
      else
        line = io.read()  -- word not found; try next line
        pos = 1           -- restart from first position
      end
    end
    return nil            -- no more lines: end of traversal
  end
end


-- use example
for word in allwords() do
  print(word)
end

