tableTest = {} -- 创建一个table，并将他的引用存储到tableTest

m = "n"
tableTest[m] = 1
tableTest[1] = "Hello"

print(tableTest["n"])  -- >>> 1
print(tableTest[m])  -- >>> 1

m = 1
print(tableTest[m])  -- >>> Hello

tableTest['n'] = tableTest['n'] + 1
print(tableTest['n'])  -- >>> 2

-- table 是匿名的，一个持有table的变量与table之间没有固定的关联性

 a = {}
 a['x'] = 1
 b = a
 print(a['x'])
 print(b['x'])
 print(a.x)

b['x'] = 10
 print(a['x'])
 print(b['x'])

a = nil
-- print(a['x'])



