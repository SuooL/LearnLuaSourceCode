-- closuer
function counter()
	local i = 0;
	return function ()
			i = i+1
			return i
		end
end


print(counter())

num = counter()
print(num())
print(num())

num2 = counter()
print(num2())
print(num2())

-- Lua 作用

print("------------------------")

do
local oldSin = math.sin
local k = math.pi/180
	math.sin = function ( x )
		return oldSin(x*k)
	end
end

print(math.sin(90))

