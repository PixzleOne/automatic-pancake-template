--[[
	Made by 
	PixzleOne
	2017
	
	Requires G = require("pixg")

	Functions:
		-add(name, [alternative location])
			add a state to the list, fetched from "states/[name]", 
			or "[alternative location]" if provided 
			(Alternative location might be untested)
		-remove(name)
			untested but should just remove a state from the list
				 (lol)
		-load(name)
			loads state [name] from the list, 
			and calls load in said state
		-update()
			calls update in currently loaded state
		-draw()
			same as update, but draw

	Variables:
		x, y - the position of the camera
]]

Pixstates = Object:extend()

function Pixstates:new()
	self.currentState = ""
	self.states = {}
end

function Pixstates:add(name, altLoc)
	loc = altLoc or "states/" .. name
	locandloaded = require(loc)
	assert(type(locandloaded) == "table", "Script doesn't return a table. Return missing?")
	self.states[name] = locandloaded
end

function Pixstates:remove(name) --UNTESTED
	self.states[name] = nil
end

function Pixstates:load(name)
	if not (self.currentState == name) then
		self.states[name].load()
	end
	self.currentState = name
end

function Pixstates:unload()
	self.currentState = ""
end

function Pixstates:update()
	if (self.states[self.currentState] ~= nil and self.states[self.currentState].update ~= nil) then
		self.states[self.currentState].update()
	end
end

function Pixstates:draw()
	if (self.states[self.currentState] ~= nil and self.states[self.currentState].draw ~= nil) then
		self.states[self.currentState].draw()
	end
end