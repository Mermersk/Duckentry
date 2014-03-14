--Dem particles.


function particlehlada()
    gulm = love.graphics.newImage("gul.png")
 
    timerast = 0
    rot = 0
    gul = love.graphics.newParticleSystem(gulm, 500)
	gul:setEmissionRate(60)
    gul:setParticleLifetime(2)
    gul:setDirection(rot)
    gul:setSpeed(30, 40)
    gul:setSizes(1, 1.2, 0.8)
    gul:setSpread(0.3)
    gul:setColors(95, 158, 160, 60, 255, 255, 255, 60)
    gul:setSpin(0, 3, 1)
end

function particleupdate(dt)


	for lykill, gildi in pairs(aster) do
		utmork_planetu = math.sqrt(((planet_x + 2500) - gildi.ast_x) * ((planet_x + 2500) - gildi.ast_x) + ((planet_y + 2500) - gildi.ast_y) * ((planet_y + 2500) - gildi.ast_y))
	    if utmork_planetu < 2600 then
	        gul:update(dt)
			rot = rot - 0.005*dt
			gul:setDirection(rot)
			asteroid_scale_x = asteroid_scale_x - 0.0001*dt
			asteroid_scale_y = asteroid_scale_y - 0.0001*dt
	    end
		
		if gildi.ast_x > 500 and asteroid_scale_x < 0.08 then  --svo að loftsteinarnir hætta að koma, þegar inn í plánetuna er komið.
	        gildi.ast_speed = 0
		end
	
	end
	for lykill, gildi in pairs(aster2) do  
	    if gildi.ast_x > 500 and asteroid_scale_x < 0.08 then
	        gildi.ast_speed = 0
		end
	
	end
	gul:start()
    
	--if asteroid_scale_x < 0.08 then
	    --gul:stop()
	--end
   -- if asteroid_scale_x < 0.079 then
	  --  table.remove(aster)
	--	table.remove(aster2)
	--end
	
	--timerast = timerast + 1*dt
	--if timerast > 4 then
	--if timerast > 4.1 then
	    --timerast = 0
	--end
end

function particleteikna()
    
	for lykill, gildi in pairs(aster) do
        love.graphics.draw(gul, gildi.ast_x, gildi.ast_y)
	end
	for lykill, gildi in pairs(aster2) do
        love.graphics.draw(gul, gildi.ast_x, gildi.ast_y)
	end
	love.graphics.print(#aster, 200, 200)
	love.graphics.print(tostring(timerast), 300, 200)

	--love.graphics.print(tostring(lengd), 200, 200)
end