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

	require("pix/pixanimation")
	animd = Pixanimations()
	animd:add("climbing", "graphics/climbing.png", 6, 3, true)
	animd:set("climbing")

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
	animd:update()
	gamestates:update()
end

function love.keypressed(k)
	--quickly exit out when testing
	if (k == "escape") then
		love.event.quit()
	elseif (k == "a") then
		animd:set("climbing")
		print("s")
	end
end

function love.draw()
	animd:draw(10, 10)
	gamestates:draw()
end