#! /usr/local/bin/lua
-- function funcname funcbody
function sumAdd(n)
	local sum = 0
	for i = 1,n do
		sum = sum + i
	end
	return sum
end

print("Enter a number: ")
num = io.read("*number")  -- io.read的选项名不再用'*'打头。但出于兼容性考虑，会继续忽略掉这个字符。
print(sumAdd(num))

-- functiondef ::= function funcbody
fact = function (n)
	if n == 0 then
		return 1
	else
		return n * fact(n-1)
	end
end

print("Enter factorial number: ")
num = io.read("*number")  -- io.read的选项名不再用'*'打头。但出于兼容性考虑，会继续忽略掉这个字符。
print(fact(num))