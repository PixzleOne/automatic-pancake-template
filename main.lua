Object = require("lib/classic"):extend()
G = require("pixp/pixg")

pprint = require("lib/pprint")

function love.load()
	--global deltatime
	dt = 0

	--settings
	love.graphics.setDefaultFilter("nearest", "nearest")
	love.graphics.scale(2, 2)
end

function love.update(delta)
	require("lib/lovebird"):update()

	dt = delta
end

function love.keypressed(k)
	--quickly exit out when testing
	if (k == "escape") then
		love.event.quit()
	end
end

function love.draw()
	
end