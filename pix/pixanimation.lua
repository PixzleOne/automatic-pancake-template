local L = require("pix/pixlogic")

A = Object:extend()

function A:new(path, nr, speed)
	self.framecount = nr

	self.frames = {}

	self.image = love.graphics.newImage(path)
	frameheight = self.image:getHeight()
	framewidth = self.image:getWidth()/nr
	for i=1, nr do
		frame = love.graphics.newQuad((i-1)*framewidth, 0, framewidth, frameheight, self.image:getDimensions())
		self.frames = L.addAt(self.frames, i, frame)
	end

	self.speed = speed or -1
end


Animations = Object:extend()

function Animations:new()
	self.animations = {}
	self.currentAnim = ""
	self.currentFrame = 1
	self.currentSpeed = 10
end

function Animations:add(name, path, nr, speed)
	anim = A(path, nr, speed)
	self.animations[name] = anim
end

function Animations:set(name)
	if (self.currentAnim == name) then
		return
	end

	self.currentAnim = name
	self.currentFrame = 1
	self.timeToNext = 0	

	s = self.animations[name].speed
	if (s > 0) then
		self.currentSpeed = s
	else
		self.currentSpeed = 1
	end
end

function Animations:setSpeed(s)
	self.currentSpeed = s
end

function Animations:update()
	self.timeToNext = self.timeToNext + dt*self.currentSpeed

	if (self.timeToNext > 1) then

		self.timeToNext = 0
		self.currentFrame = self.currentFrame + 1

		if (self.currentFrame > self.animations[self.currentAnim].framecount) then
			self.currentFrame = 1
		end

	end
end

function Animations:flip(x, y)
	self.flipx, self.flipy = x or false, y or false
end

function Animations:draw(x, y)
	image = self.animations[self.currentAnim].image
	frame = self.animations[self.currentAnim].frames[self.currentFrame]
	frx, fry, fw, fh = frame:getViewport()

	fx, fy = 1, 1
	ox, oy = 0, 0

	if (self.flipx) then
		fx = -1
		ox = 1
	end

	if (self.flipy) then
		fy = -1
		oy = 1
	end

	love.graphics.draw(image, frame, x + (ox*fw), y + (oy*fh), 0, fx, fy)
end

return Animations