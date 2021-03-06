
--function blabla()
--Asteroids stuff!
------------------------------------------------------------------------------
--Star stuff!!
--end
function asteroidshlada()

    asteroid = love.graphics.newImage("Resources/ast.png")
	aster = {
	{ast_x = 1600, ast_y = love.math.random(5, 320), ast_speed = love.math.random(25, 170), ast_snu = love.math.random(1, 20)/10, ast_start = 0},
	{ast_x = 1570, ast_y = love.math.random(5, 320), ast_speed = love.math.random(25, 170), ast_snu = love.math.random(1, 20)/10, ast_start = 0},
	{ast_x = 1650, ast_y = love.math.random(5, 320), ast_speed = love.math.random(25, 170), ast_snu = love.math.random(1, 20)/10, ast_start = 0},
	{ast_x = 1600, ast_y = love.math.random(5, 320), ast_speed = love.math.random(25, 170), ast_snu = love.math.random(1, 20)/10, ast_start = 0}
	}
	asteroid_scale_x = 0.1
	asteroid_scale_y = 0.1
	
	
	asteroid2 = love.graphics.newImage("Resources/ast2.png")
	aster2 = {
	{ast_x = 1600, ast_y = love.math.random(5, 320), ast_speed = love.math.random(70, 170), ast_snu = love.math.random(1, 20)/10, ast_start = 0},
	{ast_x = 1600, ast_y = love.math.random(5, 320), ast_speed = love.math.random(70, 170), ast_snu = love.math.random(1, 20)/10, ast_start = 0},
	{ast_x = 1550, ast_y = love.math.random(5, 320), ast_speed = love.math.random(70, 170), ast_snu = love.math.random(1, 20)/10, ast_start = 0},
	{ast_x = 1650, ast_y = love.math.random(5, 320), ast_speed = love.math.random(70, 170), ast_snu = love.math.random(1, 20)/10, ast_start = 0}
	}

---------------------------------------------------------------------------------------------------------------------------------------------------
	stjornur = {}
	for i = 1, 250 do
	    stjornur[i] = {xhnit = love.math.random(0, 480), yhnit = love.math.random(0, 380), r = love.math.random(0, 255), g = love.math.random(0, 255), b = love.math.random(0, 255), a = love.math.random(100, 255)} --Skapar 50 svona stykki! 50 xhnit og 5ö yhnit breytur
	end
	
end

function asteroidsupdate(dt)

    for lykill, gildi in pairs(aster) do      --Tegund 1 af asteroids
	    gildi.ast_x = gildi.ast_x - gildi.ast_speed*dt
		if gildi.ast_x < -100 then
		    gildi.ast_x = love.math.random(500, 675)
			gildi.ast_y = love.math.random(20, 320)
			gildi.ast_speed = love.math.random(25, 140)
		end

        if circlecollision2(ond_x, ond_y - 6, gildi.ast_x, gildi.ast_y, ond:getHeight()*0.2, asteroid:getHeight()*0.025) == true then	--set in tölur og fæ true ef collision er en false ef ekki
	        --love.audio.play(quack)
            --onoff = onoff + 1 -- Kóðinn fyrir pause takkan, skiptist alltaf á milli, + 1 þá verður pása.
			lifteljari = lifteljari + 1
			reset_takki = reset_takki + 1
        end
		
		gildi.ast_start = gildi.ast_start + gildi.ast_snu*dt
	end
	
	for lykill, gildi in pairs(aster2) do      --Tegund 2 af asteroids
	    gildi.ast_x = gildi.ast_x - gildi.ast_speed*dt
		if gildi.ast_x < -100 then
		    gildi.ast_x = love.math.random(500, 675)
			gildi.ast_y = love.math.random(5, 320)
		end

        if circlecollision2(ond_x, ond_y - 6, gildi.ast_x, gildi.ast_y, ond:getHeight()*0.2, asteroid:getHeight()*0.025) == true then	--set in tölur og fæ true ef collision er en false ef ekki
	        --love.audio.play(quack)
            --onoff = onoff + 1
			lifteljari = lifteljari + 1
			reset_takki = reset_takki + 1
        end
		
		gildi.ast_start = gildi.ast_start + gildi.ast_snu*dt
	end
    		

-----------------------------------------------------------------------------------------------------------------------------------------------------------

    for lykill, gildi in pairs(stjornur) do
	    gildi.xhnit = gildi.xhnit - 8*dt
		
		if gildi.xhnit < -0 then
		    gildi.xhnit = 482
			gildi.yhnit = love.math.random(0, 320)
		end
		
		if utmork_planetu < 2500 and gildi.a > 5 then  --Svo að stjörnurnar sjást ekki í gegnum plánetuna
		    gildi.a = gildi.a - 10*dt
		end
	end	

end

function asteroidsdraw()

    for lykill, gildi in pairs(aster) do
	    love.graphics.draw(asteroid, gildi.ast_x, gildi.ast_y, gildi.ast_start, asteroid_scale_x, asteroid_scale_y, 150, 150)
		--love.graphics.circle("fill", gildi.ast_x, gildi.ast_y, asteroid:getHeight()*0.025, 16)  --Nákvæmlega sömu tölur og í collision formúlunni, hring með dama radius þá get ég séð árekstarsvæðin!
		--love.graphics.line(ond_x, ond_y, gildi.ast_x, gildi.ast_y)  --Skemmtilegar linur!
	end
	for lykill, gildi in pairs(aster2) do
	    love.graphics.draw(asteroid2, gildi.ast_x, gildi.ast_y, gildi.ast_start, asteroid_scale_x, asteroid_scale_y, 150, 150)
		--love.graphics.circle("fill", gildi.ast_x, gildi.ast_y, asteroid:getHeight()*0.025, 16)  --Nákvæmlega sömu tölur og í collision formúlunni, hring með dama radius þá get ég séð árekstarsvæðin!
	    --love.graphics.line(ond_x, ond_y, gildi.ast_x, gildi.ast_y)
	end
	
-------------------------------------------------------------------------------------------------------------------------------------
	
	for lykill, gildi in pairs(stjornur) do
	    love.graphics.setColor(gildi.r, gildi.g, gildi.b, gildi.a)
	    love.graphics.point(gildi.xhnit, gildi.yhnit)
		love.graphics.setColor(255, 255, 255)
	end

end

function things_that_must_run_independent_from_state_of_boolean_reset(dt)

    if reset == true then --Resetta asteroids aftur svo að splandi hafi tima til að ná áttum.
	    
     	for lykill, gildi in pairs(aster) do  --Reset function, resettar asteroidana þar sem að það eru einu hlutirnir sem geta eytt lífi.
		    gildi.ast_x = gildi.ast_x + 400
		end
		for lykill, gildi in pairs(aster2) do
		    gildi.ast_x = gildi.ast_x + 400
		end
		
		reset = false
    end

	utmork_planetu = math.sqrt(((planet_x + 2500) - ond_x) * ((planet_x + 2500) - ond_x) + ((planet_y + 2500) - ond_y) * ((planet_y + 2500) - ond_y))
	
	if paused == false and flipi_y > 9.5 and reset_takki % 2 == 1 then  ---Fyrir Menu til að fara upp og niður. Reset_takkin er þarna svo að  menuið fari ekki niður þegar öndin missir líf.
	    flipi_y = flipi_y - 400*dt
    end
    if paused == true and flipi_y < 250 and reset_takki % 2 == 1 then
	    flipi_y = flipi_y + 400*dt
    end
	
	if ond_x == punktar[8].x then
	    hjortu = hjortu + (1/3)*dt
	end
	
end


--byr til tvo hringi utan um hlutina og gáir hvort þeir eru að klessa
--ax, bx, ay, by eru x- og y - hnit tveggja hluta á færingu
--iaw = image-a-width svo iay = image.a.height, ibw = image-b-width

function circlecollision(ax, ay, bx, by, iaw, iah, ibw, ibh)  
    if math.abs(ax - bx) * 2 < (iaw + ibw) and 
	math.abs(ay - by) * 2 < (iah + ibh) then
	    collision = true
	else
	    collision = false
	end
	
	return collision
	
	--if circlecollision(ond_x, ond_y, gildi.ast_x, gildi.ast_y, (ond:getWidth()/5)*0.5, ond:getHeight()*0.5, asteroid:getWidth()*0.05, asteroid:getHeight()*0.05) == true then	--set in tölur og fæ true ef collision er en false ef ekki
	        --love.audio.play(quack)
           -- paused = true
       -- end
	
end

--math.sqrt(math.abs(x-coords a - x-coords b)^2 + math.abs(y-coords a - y-coords b)^2) < radius a + radius b  radius er í raun = width/2.
function circlecollision2(xa, ya, xb, yb, rada, radb)
    if math.sqrt(math.abs(xa-xb)^2 + math.abs(ya-yb)^2) < rada + radb then
	    collision = true
	else
	    collision = false
	end
	
	return collision
end