Object = require("lib/classic"):extend()
Logic = require("pix/pixlogic")

pprint = require("lib/pprint")

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")

	require("pix/pixanimation")
	a = Animations()
	a:add("run", "graphics/run.png", 12, 25)
	a:add("test", "graphics/test.png", 3, 25)
	a:set("run")

	b = 0
	k = false
end

function love.update(dt)
	require("lib/lovebird"):update()

	a:update(dt)

	b = b + dt
	if (b > 2 and k == false) then 
		a:set("test")
		k = true
	end
end

function love.draw()
	love.graphics.scale(2, 2)

	a:draw()
end