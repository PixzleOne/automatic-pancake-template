--[[
	Made by 
	PixzleOne
	2017

	Functions:
		-add(name, path, [nr], [speed])
			adds animation to list with name [name],
			image from path [path],
			with [nr] or frames
			and plays at [speed]
		-set(name)
			sets animation to [name] from list
		-update()
			animates
			flip(x,y)
				x and y are booleans
				if true, sprite is flipped in said axis
		-draw(x,y)
			draws animated sprite at x, y
]]

Animation = Object:extend()

function Animation:new(path, nr, speed)
	self.framecount = nr

	self.frames = {}
	
	self.image = love.graphics.newImage(path)
	frameheight = self.image:getHeight()
	framewidth = self.image:getWidth()/nr
	for i=1, nr do
		frame = love.graphics.newQuad((i-1)*framewidth, 0, framewidth, frameheight, self.image:getDimensions())
		self.frames[i] = frame
	end

	self.speed = speed or -1
end

Pixanimations = Object:extend()

function Pixanimations:new()
	self.animations = {}
	self.currentAnim = ""
	self.currentFrame = 1
	self.currentSpeed = 10
end

function Pixanimations:add(name, path, nr, speed)
	anim = Animation(path, nr or 1, speed or 10)
	self.animations[name] = anim
end

function Pixanimations:set(name)
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

function Pixanimations:update()
	self.timeToNext = self.timeToNext + dt*self.currentSpeed

	if (self.timeToNext > 1) then

		self.timeToNext = 0
		self.currentFrame = self.currentFrame + 1

		if (self.currentFrame > self.animations[self.currentAnim].framecount) then
			self.currentFrame = 1
		end

	end
end

function Pixanimations:flip(x, y)
	self.flipx, self.flipy = x or false, y or false
end

function Pixanimations:draw(x, y)
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

return Pixanimations