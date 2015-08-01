-- 变量没有类型；只有值才有类型。语言中不设类型定义，每个值都“携带”了他自身的类型信息。
print("First Part：")
print(type("Hello world !"))

print(type(10.4*3))

print(type(print))

print(type(type))

print(type(true))

print(type(nil))

print(type(type(1)))
 
-- 变量没有预定义的类型，任何变量都可以包含任何类型的值。
print("Second Part：")
print(type(a))
a = 10
print(type(a))

a = "Hello Lua"
print(type(a))

a = print
a(type(a))   -- 
