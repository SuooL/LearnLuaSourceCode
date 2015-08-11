-- 在 Lua 中，函数参数的传递机制都是按位置的（positional）：调用函数时，第一个实参的值传给第一个形参，以此类推。
-- Lua 不直接支持 命名参数 的语法，但是可以借助表来实现：将所有参数打包到一个表，然后以这个表为函数的唯一参数。

function Window( options )
	-- 参数检查
	if type(options.title) ~= "string" then
		error("No Window Title")
	elseif type(options.width) ~= "number" then
		error("No Window width")
	elseif type(options.height) ~= "number" then
		error("No Window height")
	end
	-- 其他参数可选
	_Window(options.title,
		optinos.x or 0,
		options.y or 0,
		options.width, options.height,
		options.background or "white",
		options.border
		)
end

w = Window{x = 0, y =0, width = 100, height = 200, title = "Lua", background = 'green', border = true}