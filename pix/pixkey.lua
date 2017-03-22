--[[
	Made by 
	PixzleOne
	2017

	Funcitons:
		-addBind(bindId, keys)
			keys can be a string or an array of strings
		-removeBind(bindId)
		-update
			only needed for isPressed() to work properly
		-isDown(bindId)
		-isPressed(bindId)

	How to use:
		-require this file
		-ex. "keybinds = Keybinds()"
		-call "keybinds:update()" at end of frame for isPressed to work
]]

local L = require("pix/pixlogic")

Keybinds = Object:extend()

function Keybinds:new()
	self.binds = {}
	self.last = {}
end

function Keybinds:addBind(id, keys)
	if (type(keys) ~= "table") then keys = {keys} end
	assert(keys) --otherwise we could get empty stuff!! :(

	if not (self.binds[id]) then
		self.binds[id] = {}
	end

	for i,key in pairs(keys) do
		if not (L.tableContains(self.binds[id], key)) then
			self.binds[id] = L.addAtEnd(self.binds[id], key)
		end
	end
end

function Keybinds:removeBind(_id)
	for id, keyids in pairs(self.binds) do
		
		if (id == _id) then
			self.binds[id] = nil
			self.binds = L.removeNil(self.binds)
			if (L.tablelength(self.binds)==0) then return end
		end
	end
end

function Keybinds:update()
	self.last = {}
	for a,b in pairs(self.binds) do
		if self:isDown(a) then
			self.last = L.addAtEnd(self.last, tostring(a))
		end
	end
end

function Keybinds:isDown(id)
	if not (self.binds[id]) then
		return false
	end
	
	for a,b in pairs(self.binds[id]) do
		if (love.keyboard.isDown(b)) then
			return true
		end
	end

	return false
end


function Keybinds:isPressed(id)
	return (self:isDown(id) and (not L.tableContains(self.last, id)))
end