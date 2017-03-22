Pl = {}

function Pl.tablelength(t)
	if not (t) then return 0 end

	i = 0
	for a,b in pairs(t) do
		i = i + 1
	end

	return i
end

--Tables

function Pl.addAt(t, i, d) --[ut]
	t[i] = d
	return t
end

function Pl.addAtEnd(t, d)
	t[Pl.tablelength(t)+1] = d
	return t
end

function Pl.removeNil(t) --[ut]
	n = {}
	i = 1
	for a,b in pairs(t) do
		if (b) then
			n = Pl.addAt(n, i, b)
			i = i + 1
		end
	end
	return n
end

return Pl