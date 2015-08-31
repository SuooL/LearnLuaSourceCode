-- 尾调用
function funcX( ... )
	return funcY(...)
end

-- 尾调用不会消耗任何的栈空间，所以一个程序可以包含无限嵌套尾调用，也不会造成栈溢出。

function funcTail( n )
  if n > 0 then
    return funcTail(n -1)
  end
end 


function funcNo  if n > 0 then
Tail( n )
    return funcTail(n -1) + 1
  end
end 

-- funcNoTail(10000000000000000000000000)

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

-- room1()
