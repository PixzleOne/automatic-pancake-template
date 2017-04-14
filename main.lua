Object = require("lib/classic"):extend()
G = require("pix/pixg")

pprint = require("lib/pprint")

function love.load()
	print(love.graphics.getWidth())

	--settings
	love.graphics.setDefaultFilter("nearest", "nearest")
	love.graphics.scale(2, 2)
end

function love.update(dt)
	require("lib/lovebird"):update()
end

function love.keypressed(k)
	--quickly exit out when testing
	if (k == "escape") then
		love.event.quit()
	end
end

function love.draw()
	
end