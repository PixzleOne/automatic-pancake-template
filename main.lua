Object = require("lib/classic"):extend()
Logic = require("pix/pixlogic")

pprint = require("lib/pprint")

function love.load()
	require("pix/pixstates")
	gm = States()
	gm:add("menu")
	gm:load("menu")
end

function love.update(dt)

end

function love.draw()

end