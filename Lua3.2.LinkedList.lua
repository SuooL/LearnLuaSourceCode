list = nil
local str

for i = 5, 1, -1 do
	line = io.read()
	list = {next = list, value = line}
end

print("The lines you enter:")
local l = list
while l do
	print(l.value)
	l = l.next
end