intro = {}

function intro.load()
	love.graphics.setBackgroundColor(0, 0, 0, 255)

	time.scale = 1

	img = love.graphics.newImage("intro/square.png")
	logo = love.graphics.newImage("intro/logo.png")

	x = love.graphics.getWidth() / 2
	y = -50
	r = 45
	s = 250

	spins = 1.5
	tt = 0.9
	timebetweenflashes = 0.04

	m = love.graphics.getHeight() / 2
	g = m - 30

	rspeed = spins * 360 / tt
	tspeed = (g - y) / tt

	timetoflash = 0
	flash = false
	flashes = 0

	waituntildone = 0

	between = 0

	love.audio.play("intro/sound.wav", "stream")
end

function intro.update()
	if (y < g) then
		y = y + time.delta * tspeed
		r = r + time.delta * rspeed
	else
		y = g
		r = 45
		between = between + time.delta
		if (between > 0.4) then

			timetoflash = timetoflash - time.delta
			if (timetoflash < 0) then
				flash = not flash
				timetoflash = timebetweenflashes

				flashes = flashes + 1
			end

			if (flashes > 6) then
				flash = true

				waituntildone = waituntildone + time.delta
				if (waituntildone>0.6) then
					intro._end()
				end

			elseif (timetoflash < 0) then
				flash = not flash
				timetoflash = timebetweenflashes

				flashes = flashes + 1
			end
		end
	end
end

function intro.draw()
	love.graphics.draw(img, x, y, G.angle.toRadians(r), 1, 1, 25, 25)
	if (flash) then
		love.graphics.draw(logo, x-144, m+30)
	end
end

function intro._end()
	gamestates:unload()
	gamestates:remove("intro")
end

return intro