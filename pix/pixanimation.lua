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

function Animation:new(path, nr, speed, oneshot)
	self.framecount = nr

	self.oneshot = oneshot

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

function Pixanimations:add(name, path, nr, speed, oneshot)
	anim = Animation(path, nr or 1, speed or 10, oneshot or false)
	self.animations[name] = anim
end

function Pixanimations:set(name)
	if (self.currentAnim == name and (not self.animations[name].oneshot)) then
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
	self.timeToNext = self.timeToNext + time.delta*self.currentSpeed

	if (self.timeToNext > 1) then

		self.timeToNext = 0
		self.currentFrame = self.currentFrame + 1

		if (self.currentFrame > self.animations[self.currentAnim].framecount) then
			if (self.animations[self.currentAnim].oneshot) then
				self.currentFrame = self.animations[self.currentAnim].framecount
			else
				self.currentFrame = 1
			end
		end

	end
end

function Pixanimations:flip(x, y)
	self.flipx, self.flipy = x or false, y or false
end

function Pixanimations:draw(x, y, r, sx, sy)
	image = self.animations[self.currentAnim].image
	frame = self.animations[self.currentAnim].frames[self.currentFrame]
	frx, fry, fw, fh = frame:getViewport()

	fx, fy = 1, 1

	if (self.flipx) then
		fx = -1
	end

	if (self.flipy) then
		fy = -1
	end

	r = r or 0
	sx = sx or 1
	sy = sy or 1

	love.graphics.draw(image, frame, x + (fw/2), y + (fh/2), r, fx*sx, fy*sy, fw/2, fh/2)
end

return Pixanimations