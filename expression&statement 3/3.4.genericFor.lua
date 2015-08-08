local a = {11, 12, 13, 14, 15, 16, 17, 18, 19, 20}
print("--------generic for Test 1-----------")
for i, v in pairs(a) do
	print(v)
	print("index: ".. i)
end

-- 上例中，pairs 是一个迭代器（遍历表），类似的迭代器还有：

-- io.lines（遍历文件行）
-- ipairs（遍历序列）
-- string.gmatch（遍历字符串）
print("--------generic for Test 2-----------")
weekdays = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday"}

weekdaysPos = {
	["Monday"] = 1, 
	["Tuesday"] = 2, 
	["Wednesday"] = 3, 
	["Thursday"] = 4, 
	["Friday"] =5
}
print(weekdaysPos["Tuesday"])

weekdaysPosFor = {}
for i, j  in pairs(weekdays) do
	weekdaysPosFor[j] = i
end
print(weekdaysPosFor["Thursday"])

--[[
数字型 for & 泛型 for
循环变量是循环体的局部变量
]]