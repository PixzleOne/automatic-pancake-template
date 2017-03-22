local L = require("pix/pixlogic")

local Bind = Object:extend()

function Bind:new(id, key)
	self.id = id
	self.key = key
end

Keybinds = Object:extend()

function Keybinds:new()
	self.binds = {}
end

function Keybinds:addBind(id, keys)
	if (type(keys) ~= "table") then keys = {keys} end

	for i,key in pairs(keys) do
		if (self.binds[key]) then
			self.binds[key] = L.addAtEnd(self.binds[key], id)
		else
			self.binds[key] = {id}
		end
	end
end

function Keybinds:removeBind(id)
	for key, ids in pairs(self.binds) do
		
		did = false
		
		for inid,acid in pairs(ids) do
			if (acid == id) then
				self.binds[key][inid] = nil
				did = true
			end
		end

		if (did) then
			self.binds[key] = L.removeNil(self.binds[key])
			if (L.tablelength(self.binds[key]) == 0) then
				self.binds[key] = nil

				if (L.tablelength(self.binds) == 0) then
					return --break loop
				end
			end
		end
	end
end

function Keybinds:isDown(id)
	for key, ids in pairs(self.binds) do
	--	if ()
	end
end

function Keybinds:isPressed(id)

end