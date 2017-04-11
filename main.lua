Object = require("lib/classic"):extend()
Logic = require("pix/pixlogic")

pprint = require("lib/pprint")

local camera = require("pix/pixcamera")

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")

	require("pix/pixanimation")
	a = Animations()
	a:add("run", "graphics/run.png", 12, 25)
	a:add("test", "graphics/test.png", 3, 25)
	a:set("run")

	b = 0
	k = false

	camera:set(-10,-10)
end

function love.update(dt)
	require("lib/lovebird"):update()

	a:update(dt)

	camera:move(dt*5, dt*5)
end

function love.draw()
	love.graphics.scale(2, 2)

	camera:draw()
	a:draw()
end