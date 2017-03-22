Math = {}

function Math.normalizeAngle(a)
	a = a % 360

	if (a < 0) then
    	a = a + 360
	end

	return a
end

function Math.angleBetween(v1, v2)
	print(v1, v2)
	--v1 is less than v2
	if (v1 > v2) then
		a = v1
		v1 = v2
		v2 = a
	end

	if (v2-v1 > 180) then v2 = v2 - 360 end

	x = (v1+v2)/2

	return Math.normalizeAngle(x)
end

function Math.isAngleBetween(n, a, b)
	n = (360 + (n % 360)) % 360
	a = (3600000 + a) % 360
	b = (3600000 + b) % 360

	if (a < b) then
		return a <= n and n <= b
	end
	return a <= n or n <= b
end

function Math.sign(v)
	if (v > 0) then
		return 1
	elseif (v < 0) then
		return -1
	end
	return 0
end

function Math.angleDif(targetA, sourceA)
	a = targetA - sourceA
	a = (a + 180) % 360 - 180
	return a
end

function tablelength(t)
	if (t == nil) then
		return 0
	end

	i = 0
	for a,b in pairs(t) do
		i = i + 1
	end
	return i
end

function Math.clamp(x, min, max)
	if (max < min) then
		s = max
		max = min
		min = s
	end

	if (x < min) then
		return min
	end

	if (x > max) then
		return max
	end

	return x
end

return Math