local a = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}

-- break 用于终止循环（for、repeat 或者 while）。
print("-----------break Test-----------")
local pos = nil
for i = 1, #a do
	if a[i] > 5 then
		pos = i
		break
	end
end
print(pos)

-- return 用于从函数中返回结果或者结束一个函数。
-- return 有一个特殊限制：它只能作为 块（block）的最后一个语句出现.

print("-----------return Test 1-----------")
-- 返回序列 a 中值 v 对应的索引
function index(a, v)
  for i = 1, #a do
    if a[i] == v then
      print("found it")
      return i
    end
  end
  print("not found")
end

print("Pos is: " .. index(a, 2))
print("-----------return Test 2-----------")
-- 如果想在块的中间使用return，你需要借助于 do 块：

function foo()
	print("before return")
--return                    --<< 语法错误
  do return end             -- OK
   print("after return")    -- <其他语句>
end


-- goto 用于跳到指定标签（::name::）所在的代码处。其中，标签名 name 可以是任何合法的变量名。

--[[
Lua 对 goto 语句做了一些限制：
不能跳入一个块（block），因为块中的标签名对外不可见
不能跳出一个函数（function）
不能跳入一个局部变量的作用域
goto的典型应用是模拟实现一些 Lua 缺失的控制语句：
continue、多级 break（multi-level break）、
多级 continue（multi-level break）、
redo、
局部错误处理（local error handling）等
]]

local a, b = 1, 5
while a < 6 do
  ::redo::
  if a <= b then
  	print(a)
  	a = a + 1
    goto redo
  end
  print(a)
end

-- while condition do
--   if some_condition then
--     goto continue
--   end
--   <一些代码>
--   ::continue::
-- end



