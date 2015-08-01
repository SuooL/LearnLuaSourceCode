-- 表构造子是一个构造表的表达式，用于创建和初始化 table 的表达式。
print("-----Table Constructors---")

nums = {}

weekdays = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday"}

print(weekdays[1])  -- 默认索引从 1 开始

-- 初始化记录风格的 table
student = {name = "Hu", Age = 22}

-- 等价于
student = {}
student.name = "Hu"
student.age = 22

-- 修改 table
student.sex = "Male"
student.age = 23
print(student.sex)
print(student.age)
student.age = nil
print(student.age)

student.day = weekdays
print(student.day[1])
print(student.day)

-- 记录风格的初始化和列表风格的初始化混合

tableList = 
{color = "yellow", fruit = "Apple",
  {weight ="20g", length = 25},
  {m = 1, n = 2},
  {m = 3, n = 0}	
}

print(tableList.color)
print(tableList[2].m)  
print(tableList[3].m)


-- add = {+ = "add"}
-- a = 1; b = 1
-- exp = { a+b = "2"}

opnames = {["/"] = "div", ["+"] = "add"}
s = "+"
print(opnames[s])

i= 20; m = "l"

list = {[i+1] = m, [i+0] = m .. m, [i+2] = m .. m .. m }

weekdays = {[0] = "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"}
print(weekdays[1])   -- 第一个索引为0

weekdays = {"Monday",[0] = "Tuesday", "Wednesday", "Thursday", "Friday"}
print(weekdays[1])
print(weekdays[2])

color = {[1] = "Red", [2] = "Green", [3] = "Blue",}     -- 最后可以带逗号

colorNum = {[1] = "Red", [2] = "Green", [3] = "Blue"; a = 1, b = 2} -- 可以用分号分隔
