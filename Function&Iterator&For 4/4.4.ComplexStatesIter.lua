-- 具有复杂状态的迭代器

local iterator

function allwords()
	local state = {line = io.read(), pos = 1}
	return iterator, state
end

function iterator( state )
	while state.line do
		-- 搜索下一个单词
		local s, e = string.find(state.line, "%w+", state.pos)
		if s then
			-- 更新下一个位置
			state.pos = e + 1
			return string.sub(state.line, s, e)
		else
			state.line = io.read()
			state.pos = 1
		end
	end
	return nil
end
