--[[
	Made by 
	PixzleOne
	2017
	
	Camera origin point is top left

	Functions:
		-set(sx, sy)
			set camera position
		-move(mx, my)
			move camera by provided distances
		-draw
			actually move the camera

	Variables:
		x, y - the position of the camera
]]

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