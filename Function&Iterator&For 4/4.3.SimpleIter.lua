-- 迭代器是一种支持指针类型的结构，它可以遍历集合的每一个元素。
-- 在Lua中我们常常使用函数来描述迭代器，每次调用该函数就返回集合的下一个元素。
-- 迭代器需要保留上一次成功调用的状态和下一次成功调用的状态，也就是他知道来自于哪里和将要前往哪里。闭包提供的机制可以很容易实现这个任务。
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

-- 记住：闭包是一个内部函数，它可以访问一个或者多个外部函数的外部局部变量。每次闭包的成功调用后这些外部局部变量都保存他们的值（状态）。
-- 当然如果要创建一个闭包必须要创建其外部局部变量。所以一个典型的闭包的结构包含两个函数：一个是闭包自己；另一个是工厂（创建闭包的函数）。
-- 举一个简单的例子，我们为一个list写一个简单的迭代器，与ipairs()不同的是我们实现的这个迭代器返回元素的值而不是索引下标：
function list_iter (t)
    local i = 0
    local n = table.getn(t)
    return function ()
       i = i + 1
       if i <= n then return t[i] end
    end
end
-- 这个例子中list_iter是一个工厂，每次调用他都会创建一个新的闭包（迭代器本身）。
-- 闭包保存内部局部变量(t,i,n)，因此每次调用他返回list中的下一个元素值，当list中没有值时，返回nil.我们可以在while语句中使用这个迭代器：
t = {10, 20, 30}
iter = list_iter(t)      -- creates the iterator
while true do
    local element = iter()   -- calls the iterator
    if element == nil then break end
    print(element)
end
-- 为迭代而生的泛型 for 循环
t = {10, 20, 30}
for element in list_iter(t) do
    print(element)
end
-- 泛型for为迭代循环处理所有的薄记（bookkeeping）：首先调用迭代工厂；内部保留迭代函数，因此我们不需要iter变量；
-- 然后在每一个新的迭代处调用迭代器函数；当迭代器返回nil时循环结束（后面我们将看到范性for能胜任更多的任务）。

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
<var-list>是以一个或多个逗号分隔的变量名列表，<exp-list>是以一个或多个逗号分隔的表达式列表，
通常情况下exp-list只有一个值：迭代工厂的调用。
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

-- 前面我们看到的迭代器有一个缺点：每次调用都需要创建一个闭包，大多数情况下这种做法都没什么问题，
-- 例如在allwords迭代器中创建一个闭包的代价比起读整个文件来说微不足道，然而在有些情况下创建闭包的代价是不能忍受的。
-- 在这些情况下我们可以使用范性for本身来保存迭代的状态。