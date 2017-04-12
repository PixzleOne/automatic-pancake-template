game = {}

function game:load()
	require("pix/pixkey")
	keys = Keybinds()

	keys:add("left", {"left", "a"})
	keys:add("right", {"right", "d"})

	require("obj/player")
	player = Player(10, 200)
end

function game:update()
	player:update()

	keys:update()
end

function game:draw()
	player:draw()
end

return game