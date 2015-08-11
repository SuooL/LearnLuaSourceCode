-- 非全局的函数
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

local fact = function (n)
	if n == 0 then return 1
		else return n*fact(n-1)
	end
end

