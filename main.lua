Object = require("lib/classic"):extend()
Logic = require("pix/pixlogic")

pprint = require("lib/pprint")

function love.load()
	require("pix/pixkey")
	keys = Keybinds()
	keys:addBind("jump", {"x", "c", "v"})
	keys:addBind("abc123", {"x", "c", "v"})
	

	pprint(keys)
end

function love.update(dt)
    require("lib/lovebird"):update()

    --print(keys.isDown("jump"))
end

function love.draw()

end