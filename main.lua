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

	--states
	require("pix/pixstates")
	gamestates = Pixstates()

	--intro
	gamestates:add("intro", "intro/intro")
	gamestates:load("intro")
	introdone = false
end

function introisdone()
	introdone = true

	--post-intro code here
end

function love.update(dt)
	require("lib/lovebird"):update()
	
	if (gamestates.currentState == "" and not introdone) then
		introisdone()
	end

	time:update(dt)
	gamestates:update()
end

function love.keypressed(k)
	--quickly exit out when testing
	if (k == "escape") then
		love.event.quit()
	end
end

function love.draw()
	gamestates:draw()
end