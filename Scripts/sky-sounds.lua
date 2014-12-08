--Ský og öll forritun fyrir hljóð

function skysoundshlada()

    sky = love.graphics.newImage("Resources/skyh.png")
	skytafla = {}
	for i = 1, 6 do
	    skytafla[i] = {sky_x = love.math.random(550, 700), sky_y = love.math.random(50, 330), sky_speed = love.math.random(15, 40), scale = love.math.random(5, 10)/10, sky_alpha = love.math.random(75, 230)}
	end
	tafla_y = 280
	
	kakk = love.audio.newSource("Resources/duck1.ogg") 
	kakk:setPitch(0.9)
	
	vind = love.audio.newSource("Resources/vindur.ogg")
	vind_volume = 0
    vind:setVolume(vind_volume)
	uppnidur_sky = 5
	
	fugl = love.audio.newSource("Resources/fugl.ogg")
	fugl_volume = 0.1
	fugl:setVolume(fugl_volume)
	
end

function skysoundsupdate(dt)

    vind:setVolume(vind_volume)
    for lykill, gildi in pairs(skytafla) do
	    if utmork_planetu < 850 then
		    gildi.sky_x = gildi.sky_x - gildi.sky_speed*dt
			gildi.sky_y = gildi.sky_y - uppnidur_sky*dt   --Talan hér er hversu hratt skýin fara upp.
			
			love.audio.play(vind)
			if vind_volume < 0.65 and skog_y > 50 then
			    vind_volume = vind_volume + 0.01*dt
			end
			
			rot = rot + 0.005*dt --Svo að particle-halinn fari ekki að gægast inn í myndina
		end
		
		if gildi.sky_x < - 200 and tretimer < vatnstart then  --ský fyrir skóg, en svo seinni fyrir til að láta skýin hverfa þegar vatnið kemur
		    gildi.sky_x = love.math.random(550, 700)
			gildi.sky_y = love.math.random(0, tafla_y)  --Til að breyta úr 280 í 140 þegar skógurinn kemur
			gildi.scale = love.math.random(5, 10)/10
			gildi.sky_speed = love.math.random(15, 40)
			gildi.sky_alpha = love.math.random(75, 230)
        end
		if gildi.sky_y > 200 then
		    gildi.sky_y = 1
		end
	end
	
	
	if skog_y < 100 then  --Hlutir sem breytast þegar skógurinn kemur.
	    tafla_y = 60
	    uppnidur_sky = 0
		if fugl_volume < 1 and tretimer < vatnstart then
		    fugl_volume = fugl_volume + 0.2*dt
			else if fugl_volume > 0.2 then
                fugl_volume = fugl_volume - 0.1*dt
			end
		end
        fugl:setVolume(fugl_volume)		
		love.audio.play(fugl)
		if vind_volume > 0.04 then
			vind_volume = vind_volume - 0.08*dt
		end
	end	    

end

function skysoundsdraw()

    for lykill, gildi in pairs(skytafla) do
	    love.graphics.setColor(255, 255, 255, gildi.sky_alpha)
	    love.graphics.draw(sky, gildi.sky_x, gildi.sky_y, 0, gildi.scale, gildi.scale)
		love.graphics.setColor(255, 255, 255, 255)
	end
	
	--love.graphics.print(fugl_volume, 50, 50)
end