--Dem particles.


function particlehlada()
    gulm = love.graphics.newImage("gul.png")
 
    timerast = 0
    rot = 0
	opacity = 0 
    gul = love.graphics.newParticleSystem(gulm, 500)
	gul:setEmissionRate(60)
    gul:setParticleLifetime(2)
    gul:setDirection(rot)
    gul:setSpeed(30, 40)
    gul:setSizes(1, 1.2, 0.8)
    gul:setSpread(0.3)
    gul:setColors(95, 158, 160, 60, 255, 255, 255, 60)
    gul:setSpin(0, 3, 1)
	
	heat = love.graphics.newParticleSystem(gulm, 500)
	heat:setEmissionRate(100)
    heat:setParticleLifetime(1.5)
   -- heat:setDirection(ond_rot - 0.3)
    heat:setSpeed(40, 50)
    heat:setSizes(1, 1.2, 0.8)
    heat:setSpread(0.2)
    heat:setColors(175, 40, 50, opacity, 33, 33, 33, opacity)
    heat:setSpin(6, 9, 1)
	heat:setLinearAcceleration( 0, 15, 0, 25)
	
	heat2 = love.graphics.newParticleSystem(gulm, 500)
	heat2:setEmissionRate(100)
    heat2:setParticleLifetime(1.5)
   -- heat:setDirection(ond_rot - 0.3)
    heat2:setSpeed(40, 50)
    heat2:setSizes(1, 1.2, 0.8)
    heat2:setSpread(0.2)
    heat2:setColors(175, 40, 50, opacity, 33, 33, 33, opacity)
    heat2:setSpin(6, 9, 1)
	heat2:setLinearAcceleration( 0, -15, 0, -25)
	
end

function particleupdate(dt)


	for lykill, gildi in pairs(aster) do
	    if utmork_planetu < 2700 then
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
	
	heat:start()
	heat2:start()
	--heat:update(dt)
	--heat2:update(dt)
	heat:setColors(175, 40, 50, opacity, 33, 33, 33, opacity) --Sco að particleinn "poppi" eki bara inn heldur koma hægt og hægt
	heat2:setColors(175, 40, 50, opacity, 33, 33, 33, opacity)
	gul:setColors(95, 158, 160, opacity, 255, 255, 255, opacity)
	if opacity < 100 and utmork_planetu < 2600 then
        opacity = opacity + 2.5*dt	
	end
    
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
	
	love.graphics.draw(heat, ond_x + 48, ond_y - 8, ond_rot - 0.6)
	love.graphics.draw(heat2, ond_x + 48, ond_y - 6, ond_rot + 0.6)
	
	
	--love.graphics.print(#aster, 200, 200)
	--love.graphics.print(tostring(timerast), 300, 200)

	--love.graphics.print(tostring(lengd), 200, 200)
end