Object = require("lib/classic"):extend()
G = require("pix/pixg")

pprint = require("lib/pprint")

function love.load()
	--settings
	love.graphics.setDefaultFilter("nearest", "nearest")
	love.graphics.scale(2, 2)
	--time
	require("pix/pixtime")
	time = Pixtime()

	require("pix/pixcamera")
	camera = Pixcamera()
	camera:shake(20, 1)
end

function love.update(dt)
	require("lib/lovebird"):update()
	time:update(dt)
	camera:update()
end

function love.keypressed(k)
	--quickly exit out when testing
	if (k == "escape") then
		love.event.quit()
	end
end

function love.draw()
	camera:draw()
	love.graphics.circle("fill", 200, 200, 50, 50)
end