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

function Animations:update(dt)
	self.timeToNext = self.timeToNext + dt*self.currentSpeed

	if (self.timeToNext > 1) then

		self.timeToNext = 0
		self.currentFrame = self.currentFrame + 1

		if (self.currentFrame > self.animations[self.currentAnim].framecount) then
			self.currentFrame = 1
		end

	end
end

function Animations:draw(x, y)
	image = self.animations[self.currentAnim].image
	frame = self.animations[self.currentAnim].frames[self.currentFrame]
	love.graphics.draw(image, frame, x, y)
end

return Animations