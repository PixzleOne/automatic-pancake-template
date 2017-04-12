--UNFINISHED
--SHOULDN'T BE USED

local L = require("logic")

Drawable = Object:extend()
function Drawable:new(da, x, y)

end

function Drawable:draw()
	love.graphics.draw(self.da, self.x, self.y)
end

Pixqueue = {
	queue = {}
}

function Pixqueue:add(pos, da, x, y)
	acpos = pos
	i = 1
	repeat
		acpos = pos..i
		i = i + 1
	until (self.queue[acpos] == nil)

	self.queue = L.addAt(self.queue, acpos, Drawable(da, x, y))
end

function Pixqueue:draw()


	pixqueue = {}
end

return Pixqueue