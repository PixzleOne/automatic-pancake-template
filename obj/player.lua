M = require("pix/pixmath")

Player = Object:extend()

function Player:new(x, y)
	self.x = x or 0
	self.y = y or 0

	self.movespeed = 1
	self.facing = 1
	self.mx, self.my = 0, 0

	require("pix/pixanimation")
	self.animation = Animations()
	self.animation:add("run", "graphics/run.png", 12, 25)
	self.animation:add("idle", "graphics/idle.png", 1, 10)
	self.animation:set("run")
end

function Player:update()
	self.mx = M.btf(keys:isDown("right")) - M.btf(keys:isDown("left"))
	self.mx = self.mx * dt * 100 * self.movespeed
	self.x, self.y = self.x + self.mx, self.y + self.my

	if (self.mx ~= 0) then
		self.facing = M.sign(self.mx)
	end

	self:animate()
end

function Player:animate()
	if (M.isBetween(self.mx, -1, 1)) then
		self.animation:set("idle")
	else
		self.animation:set("run")
	end

	self.animation:flip(self.facing < 0)
	self.animation:update()
end

function Player:draw()
	self.animation:draw(self.x, self.y)
end