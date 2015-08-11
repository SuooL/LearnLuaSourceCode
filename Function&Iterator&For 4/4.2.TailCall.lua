-- 尾调用
function funcX( ... )
	return funcY(...)
end

-- 错误的姿势
function f(x)
	g(x)
end

function f(x)
	return g(x)+1
end

function f(x)
	return (g(x))
end

function f(x)
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
