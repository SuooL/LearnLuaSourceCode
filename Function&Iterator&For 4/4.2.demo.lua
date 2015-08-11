local func = function ( ... )
	-- body
end

local func2 = function (x)
	-- body
	func()
end

---
local function function_name2( ... )
	-- body
end


---- 展开姿势

local function func3( ... ) 
	-- body
end

local func3
foo = function ( ... )
	-- body
end

local  function fact(n)
	if n == 0 then return 1
		else return n*fact(n-1)
	end
end

print(fact(5))