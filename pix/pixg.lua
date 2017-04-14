--[[
	Made by 
	PixzleOne
	2017
	
	General functions are under 	pixg
	Table functions are under 		pixg.table
	Angle functions are under		pixg.angle
]]

pixg = {}

--
--	General
--

function pixg.tablelength(t)
	print("USE pixg.table.length DAMMIT!")
	return pixg.table.lenth(t)
end

function pixg.sign(a)
	if (a > 0) then
		return 1
	elseif (a < 0) then
		return -1
	end
	return 0
end

function pixg.clamp(a, min, max)
	if (max < min) then
		s = max
		max = min
		min = s
	end

	if (a < min) then
		return min
	end

	if (a > max) then
		return max
	end

	return a
end

function pixg.btf(b)
	if (b) then
		return 1
	end
	return 0
end

function pixg.isBetween(a, min, max)
	if (min > max) then
		min, max = max, min
	end

	if (a > min and a < max) then
		return true
	end
	return false
end

function pixg.lerp(a, b, t)
	return a + (b- a) * t
end

--
--	Angles
--

pixg.angle = {}

function pixg.angle.normalize(a)
	a = a % 360

	if (a < 0) then
    	a = a + 360
	end

	return a
end

function pixg.angle.between(a, b)
	--a is less than b
	if (a > b) then
		a,b = b,a --should work?
	end

	if (b-a > 180) then b = b - 360 end

	x = (a+b)/2

	return Math.normalizeAngle(x)
end

function pixg.angle.isBetween(a, min, max)
	a = (360 + (a % 360)) % 360
	min = (3600000 + min) % 360
	max = (3600000 + max) % 360

	if (min < max) then
		return min <= a and a <= max
	end
	return min <= a or a <= max
end

function pixg.angle.dif(a, b)
	r = a - b
	r = (r + 180) % 360 - 180
	return r
end

--
--	Tables
--

pixg.table = {}

function pixg.table.length(t)
	i = 0
	for a,b in pairs(t) do
		i = i + 1
	end

	return i
end

function pixg.table.addAtEnd(t)
	t[pixg.table.length(t)+1] = d
	return t
end

--used to be called removeNil
function pixg.table.clean(t)
	n = {}
	i = 1
	for a,b in pairs(t) do
		if (b) then
			if (type(a)=="string") then
				n = Pl.addAt(n, a, b)
			else
				n = Pl.addAt(n, i, b)
				i = i + 1
			end
		end
	end
	return n
end

function pixg.table.contains(t, v)
	for a,b in pairs(t) do
		if (b == v) then
			return true
		end
	end
	return false
end

return pixg