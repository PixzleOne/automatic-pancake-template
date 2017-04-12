Object = require("lib/classic"):extend()
Logic = require("pix/pixlogic")

pprint = require("lib/pprint")

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	
	require("pix/pixstates")
	gamestates = States()
	gamestates:add("game")
	gamestates:load("game")
	
	dt = 0
end

function love.update(deltatime)
	require("lib/lovebird"):update()

	dt = deltatime
	gamestates:update(dt)
end

function love.keypressed(k)
	if (k == "escape") then
		love.event.quit()
	end
end

function love.draw()
	love.graphics.scale(2, 2)

	gamestates:draw()
end