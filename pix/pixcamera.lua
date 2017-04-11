Pixcamera = {
	x = 0,
	y = 0
}

function Pixcamera:set(sx, sy)
	self.x = -sx or 0
	self.y = -sy or 0
end

function Pixcamera:move(mx, my)
	self.x = self.x - (mx or 0)
	self.y = self.y - (my or 0)
end

function Pixcamera:draw()
	love.graphics.translate(self.x, self.y)
end

return Pixcamera