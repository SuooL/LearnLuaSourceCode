-- 非全局的函数
-- Lua中函数可以作为全局变量也可以作为局部变量，我们已经看到一些例子：
-- 函数作为table的域（大部分Lua标准库使用这种机制来实现的比如io.read、math.sin）。
-- 这种情况下，必须注意函数和表语法：
lib = {}
lib.add = function ( x, y )
	return x+y
end
lib.sub = function ( x, y )
	return x-y
end

-- 构造式
lib2 = {
add = function ( x, y ) return x+y end,
sub = function ( x, y ) return x-y end
}

-- 特殊式
lib3 = {}
function lib3.add(x, y) return x+y end
function lib3.sub(x, y) return x-y end

-- 当我们将函数保存在一个局部变量内时，我们得到一个局部函数，也就是说局部函数像局部变量一样在一定范围内有效。
-- 这种定义在包中是非常有用的：因为Lua把chunk当作函数处理，在chunk内可以声明局部函数（仅仅在chunk内可见），
-- 词法定界保证了包内的其他函数可以调用此函数。下面是声明局部函数的两种方式：
--1. 方式一
local f = function (...)
    --body
end

--2. 方式二
local function f (...)
    --body
end


local fact 
fact = function (n)
	if n == 0 then return 1
		else return n*fact(n-1)
	end
end

print(fact(10))