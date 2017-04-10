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

function States:load(name)
	self.states[name].load()
end

function States:update(dt)
	self.states[name].update(dt)
end

function States:draw()
	self.states[name].draw()
end