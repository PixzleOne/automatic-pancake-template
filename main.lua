Object = require("lib/classic"):extend()
G = require("pix/pixg")

pprint = require("lib/pprint")

function love.load()
	dt = 0
end

function settings()
	love.graphics.setDefaultFilter("nearest", "nearest")
	love.graphics.scale(2, 2)
end

function love.update(delta)
	require("lib/lovebird"):update()

	--global deltatime
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