 --WHAT THE F IS THIS EVEN

local bump = require("bump")
local L = require("pix/pixlogic")

lm = {}

function lm:load(path)
	self.world = bump.newWorld(32)

	loaded = require(path)
	for y=1, tablelength(loaded)
end

function lm:update()

end

function lm:draw()

end

return lm