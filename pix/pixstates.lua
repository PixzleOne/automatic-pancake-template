local L = require("pix/pixlogic")

States = Object:extend()

function States:new()
	self.currentState = ""
	self.states = {}
end

function States:add(name, altLoc)
	loc = altLoc or "states/" .. name
	locandloaded = require(loc)
	assert(type(locandloaded) == "table", "Script doesn't return a table. Return missing?")
	self.states = L.addAt(self.states, name, locandloaded)
end

function States:remove(name) --UNTESTED
	self.states[name] = nil
end

function States:load(name)
	if not (self.currentState == name) then
		self.states[name].load()
	end
	self.currentState = name
end

function States:update(dt)
	if (self.states[self.currentState].update ~= nil) then
		self.states[self.currentState].update(dt)
	end
end

function States:draw()
	if not (self.states[self.currentState].draw == nil) then
		self.states[self.currentState].draw()
	end
end