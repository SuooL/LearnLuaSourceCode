-- 可变参数函数 是指一个函数，它可以接收个数可变的参数。例如 print 就是一个可变参数函数。

print("-------------Variable TestFir-----------")
-- 将参数作为结果直接返回
function identity(...)
  return ...
end

print(identity("a", "b", "c"))    -- "a", "b", "c"

-- 参数列表中的三个点 (...) 表明函数是可变参数的（variadic）。
-- 在函数内部，可以通过表达式 ... 来获取实际传递给函数的参数，
-- 表达式 ... 被称为可变参数表达式，它的行为与“返回多个结果的函数”类似。

print("-------------Variable TestSec-----------")
-- 以下两个函数 show1 和 show2 的功能等价
function show1(x, y, z)
  print(x, y, z)
end

function show2(...)
  local x, y, z = ...
  print(x, y, z)
end

print("-------------Variable TestThir-----------")
-- 可变参数函数也可以有任意个数的固定参数，但固定参数必须出现在可变参数之前：

function fwrite(fmt, ...)
  return io.write(string.format(fmt, ...))
end

-- fwrite()                -- fmt=nil, 没有额外参数（会报错，因为 string.format 需要一个字符串参数）
fwrite("a\n")              -- fmt="a", 没有额外参数
fwrite("%d %d\n", 4, 5)    -- fmt="%d%d", 额外参数：4, 5

print("-------------Variable TestFor-----------")
--[[
如果可变参数中不存在 nil，则可以在函数内部借助 {...} 来收集或遍历所有参数；
如果可变参数中存在 nil，{...} 就不再是一个合法的序列，此时就需要借助 table.pack 函数（由 table.pack 返回的表，
其中包含一个额外的字段 n，它记录了函数的实际参数个数）。
]]

-- 可变参数中不存在 nil
function sum(...)
  local s = 0
  for i, v in ipairs({...}) do
    s = s + v
  end
  return s
end

print(sum())           -- 0
print(sum(1))          -- 1
print(sum(1, 2, 3))    -- 6

-- 可变参数中存在 nil
function has_nils(...)
  local arg = table.pack(...)
  for i = 1, arg.n do
    if arg[i] == nil then
      return true
    end
  end
  return false
end

print(has_nils())             -- false
print(has_nils(nil))          -- true
print(has_nils(0, 1))         -- false
print(has_nils(1, nil, 3))    -- true

print("-----------Another--------------")

function select_nils(...)
	for i=1, select('#',...) do
		local arg = select(i, ...)
		if arg == nil then
			return true;
		end
	end
  return false
end

print(select_nils())
print(select_nils(nil))
print(select_nils(0, 1))
print(select_nils(1, nil, 3))

-- 如果可变参数中不可能有 nil 值，则建议使用 {...}（而不是 table.pack(...)），因为它更简洁、速度更快。










