local L = require("pix/pixlogic")

States = Object:extend()

function States:new()
	self.currentState = ""
	self.states = {}
end

function States:add(name, altLoc)
	loc = altLoc or "states/" .. name
	self.states = L.addAt(self.states, name, require(loc))
end

function States:remove(name) --UNTESTED
	self.states[name] = nil
end

function States:load(name)
	self.currentState = name
	if not (self.currentState == name) then
		self.states[self.currentState].load()
	end
end

function States:update(dt)
	if not (self.currentState == name) then
		self.states[self.currentState].update(dt)
	end
end

function States:draw()
	if not (self.currentState == name) then
		self.states[self.currentState].draw()
	end
end