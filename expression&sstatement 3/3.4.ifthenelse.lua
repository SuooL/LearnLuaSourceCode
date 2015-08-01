-- if then else 语句
-- Lua 先测试条件，然后跳转

print("--------Test-1---------")
a, b= 1, 2
if a < 0 then
	r = 0 
end
print(r)

print("--------Test-2---------")
if a < b then
  r = a
else
  r = b
end
print(r)

print("--------Test-3---------")
op = "-"
if op == "+" then
  r = a + b
elseif op == "-" then
  r = a - b
elseif op == "*" then
  r = a * b
elseif op == "/" then
  r = a / b
else
  error("invalid operation")
end

print(r)

-- Lua 不支持 switch 语句