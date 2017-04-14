--[[
	Made by 
	PixzleOne
	2017
	
	update(dt)
	setScale(s)
	pause(t)
	
	Scale will reset after pause
]]

Pixtime = Object:extend()

function Pixtime:new(s)
	self.scale = s or 1
	self.pauseleft = 0
	self.scaleBeforePause = 1
end

function Pixtime:update(dt)
	if (self.pauseleft ~= 0) then
		self.scale = 0

		self.pauseleft = self.pauseleft - dt
		if (self.pauseleft < 0) then
			self.scale = self.scaleBeforePause
			self.pauseleft = 0
		end
	end
	self.unscaledDelta = dt
	self.delta = dt * self.scale
end

function Pixtime:setScale(s)
	self.scale = s
end

function Pixtime:pause(t)
	self.scaleBeforePause = self.scale
	self.pauseleft = t
end