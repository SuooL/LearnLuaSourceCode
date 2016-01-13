-- closure
-- 当一个函数内部嵌套另一个函数定义时，内部的函数体可以访问外部的函数的局部变量，这种特征我们称作词法定界。
-- 虽然这看起来很清楚，事实并非如此，词法定界加上第一类函数在编程语言里是一个功能强大的概念，很少语言提供这种支持。
-- 技术上来讲，闭包指值而不是指函数，函数仅仅是闭包的一个原型声明；
-- 尽管如此，在不会导致混淆的情况下我们继续使用术语函数代指闭包。

-- 成绩
names = {"Peter", "Paul", "Mary"}
grades = {Mary = 10, Paul = 17, Peter = 7}

table.sort(names, function (n1, n2)
    return grades[n1] > grades[n2]    -- compare the grades
end)

print(unpack(names))

function sortbygrade (names, grades)
    table.sort(names, function (n1, n2)
       return grades[n1] <= grades[n2]    -- compare the grades
    end)
end

sortbygrade(names, grades)

print(unpack(names))

function counter()
	local i = 0;
	return function ()
		i = i+1
		return i
	end
end


print(counter())
print("---------- One ---------")
num = counter()
print(num())
print(num())
print("---------- Two ---------")
num2 = counter()
print(num2())
print(num2())

-- Lua 作用
-- 闭包在上下文环境中提供很有用的功能，如前面我们见到的可以作为高级函数（sort）的参数；作为函数嵌套的函数（newCounter）。
-- 这一机制使得我们可以在Lua的函数世界里组合出奇幻的编程技术。
-- 闭包也可用在回调函数中，比如在GUI环境中你需要创建一系列button，但用户按下button时回调函数被调用，
-- 可能不同的按钮被按下时需要处理的任务有点区别。具体来讲，一个十进制计算器需要10个相似的按钮，每个按钮对应一个数字，可以使用下面的函数创建他们
function digitButton (digit)
    return Button{  label = digit,
           action = function ()
              add_to_display(digit)
           end
    }
end
-- 这个例子中我们假定Button是一个用来创建新按钮的工具， label是按钮的标签，action是按钮被按下时调用的回调函数。（实际上是一个闭包，因为他访问upvalue digit）。
-- digitButton完成任务返回后，局部变量digit超出范围，回调函数仍然可以被调用并且可以访问局部变量digit。
-- 闭包在完全不同的上下文中也是很有用途的。因为函数被存储在普通的变量内我们可以很方便的重定义或者预定义函数。通常当你需要原始函数有一个新的实现时可以重定义函数。例如你可以重定义sin使其接受一个度数而不是弧度作为参数：
print("------------------------")

print(math.sin(90))

do
	local oldSin = math.sin
	local k = math.pi/180
	math.sin = function ( x )
		return oldSin(x*k)
	end
end

print(math.sin(90))

-- 利用同样的特征我们可以创建一个安全的环境（也称作沙箱，和java里的沙箱一样），
-- 当我们运行一段不信任的代码（比如我们运行网络服务器上获取的代码）时安全的环境是需要的，
-- 比如我们可以使用闭包重定义io库的open函数来限制程序打开的文件。
do
    local oldOpen = io.open
    io.open = function (filename, mode)
       if access_OK(filename, mode) then
           return oldOpen(filename, mode)
       else
           return nil, "access denied"
       end
    end
end