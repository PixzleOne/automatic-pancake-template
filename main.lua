Object = require("lib/classic"):extend()
pprint = require("lib/pprint")
require("lib/sound")

G = require("pix/pixg")

function love.load()
	--settings
	love.graphics.setDefaultFilter("nearest", "nearest")
	love.graphics.scale(2, 2)

	--time
	require("pix/pixtime")
	time = Pixtime()
end

function love.update(dt)
	require("lib/lovebird"):update()

	time:update(dt)
end

function love.keypressed(k)
	--quickly exit out when testing
	if (k == "escape") then
		love.event.quit()
	end
end

function love.draw()

end