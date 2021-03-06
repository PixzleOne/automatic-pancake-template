--[[
	Made by 
	PixzleOne
	2017
	
	Shake requires time to be time

	Camera:draw must be called before drawcalls

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

Pixcamera = Object:extend()

function Pixcamera:new(x, y)
	self.x, self.y = x or 0, y or 0
	self.x, self.y = -self.x, -self.y

	self.shakes = { strength = 0,	
					time = 0,
					current = {x=0,y=0} }
end

function Pixcamera:set(sx, sy)
	if (self.hasEdge) then
		sw, sh = love.graphics.getWidth(), love.graphics.getHeight()
		osx, osy = sx, sy
		sx = G.clamp(sx, self.edge.ax, self.edge.bx-sw)
		sy = G.clamp(sy, self.edge.ay, self.edge.by-sh)
	end
		
	self.x = sx
	self.y = sy
end

function Pixcamera:border(ax, ay, bx, by)
	self.edge = {ax = ax or 0, ay = ay or 0, 
				 bx = bx or 0, by = by or 0}
	if (math.abs(ax)+math.abs(ay)+math.abs(bx)+math.abs(bx)~=0) then
		self.hasEdge = true
	else
		self.hasEdge = false
	end
end

function Pixcamera:move(mx, my)
	self:set(self.x+mx, self.y+my)
end

function Pixcamera:shake(s, t)
	self.shakes.strength = s
	self.shakes.time = t
end

function Pixcamera:update()
	if (self.shakes.time > 0) then
		self.shakes.time = self.shakes.time - time.delta

		--shake
		sx, sy = love.math.random(-self.shakes.strength, self.shakes.strength),
				 love.math.random(-self.shakes.strength, self.shakes.strength)
		self.shakes.current = {x=sx, y=sy}
	end
end

function Pixcamera:draw()
	--move and shakee
	love.graphics.translate(-self.x+self.shakes.current.x, -self.y+self.shakes.current.y)
end