-- 求导 (f(x+d)-f(x))/d
function derivative( f, delta )
	delta = delta or 1e-9
	return function ( x )
		return(f(x+delta)-f(x))/delta
	end
end

der = derivative(math.sin)

print(math.cos(90), der(90))

function pow2( x )
	if x ~= nil then
		return x*x
	else
		error("Argument nil")
	end
end

der = derivative(pow2)

print(der(-1))
print(der(2))
