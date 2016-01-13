-- 尾调用
-- 尾调用是一种类似在函数结尾的goto调用，当函数最后一个动作是调用另外一个函数时，我们称这种调用尾调用。
function funcX( ... )
	return funcY(...)
end
-- 例子中funcX调用funcY后不会再做任何事情，这种情况下当被调用函数结束时程序不需要返回到调用者；
-- 所以尾调用之后程序不需要在栈中保留关于调用者的任何信息。
-- 一些编译器比如Lua解释器利用这种特性在处理尾调用时不使用额外的栈，我们称这种语言支持正确的尾调用。
-- 尾调用不会消耗任何的栈空间，所以一个程序可以包含无限嵌套尾调用，也不会造成栈溢出。

function funcTail( n )
  if n > 0 then
    return funcTail(n -1)
  end
end 


function funcNoTail( n )  if n > 0 then
    return funcTail(n -1) + 1
  end
end 

--funcNoTail(10000000000000000000000000)

-- 错误的姿势
function f1(x)
	g(x)
end

function f2(x)
	return g(x)+1
end

function f3(x)
	return (g(x))
end

function f4(x)
	return x or g(x)
end



-- 唯一的姿势
-- return <func>(<args>)

-- return x[i].f(a*b+2)

function room1()
	local move = io.read()
  	if move == "south" then return room3()
  	elseif move == "east" then return room2()
  	else
    print("invalid move")
    return room1()    -- 留在当前房间
  end
end

function room2()
  	local move = io.read()
  	if move == "south" then return room4()
  	elseif move == "west" then return room1()
  	else
    	print("invalid move")
    	return room2()    -- 留在当前房间
  	end
end

function room3()
	local move = io.read()
  	if move == "north" then return room1()
  	elseif move == "east" then return room4()
  	else
    	print("invalid move")
    	return room3()    -- 留在当前房间
  end
end

function room4()
	print("Congratulations, you won!")
end

room1()