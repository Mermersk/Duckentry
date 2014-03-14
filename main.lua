--Learning Android development and make Duckentry!
require("AnAL")
require("conf")
require("pause-reset")
require("hugsinn")
require("asteroids-stars")
require("Nebula-engine")
require("planet")
require("particles")
function love.load()
    
    font = love.graphics.newFont("Dimbo Regular.ttf", 18) --Venjulegi
    font2 = love.graphics.newFont("Dimbo Regular.ttf", 30) 	--Stærri fonturinn
 
	ond = love.graphics.newImage("tond.png")
    hond = newAnimation(ond, 119, 88, 0.1, 0)
	ond_x = 75
	ond_y = 150
	ond_rot = 3.14
	ond_speed = 1
	ond_upp = 10
	ond_down = 5
	
	reset = false
	timer = 0
	
    asteroidshlada() --asteroids hlaða allt inn
	flipihlada()
	hugshlada()
	nebulahlada()
	planethlada()
	particlehlada()
	quack = love.audio.newSource("duck.mp3", "static")
    
	
end

function love.update(dt)
	mx, my = love.mouse.getPosition()
    maxi = love.graphics.getMaxImageSize()  --hæsta width/height sem mynd eða canvas má vera á tilteknu tæki
    asteroids_must_run_independent_from_state_of_boolean_reset(dt)
  
    if reset == true then
	    return
	end
	
	if paused == true then
	    return
	end
	
	asteroidsupdate(dt) -- asteroidarnir og það sem þarf alltaf að hafa gætur á.
    nebulaupdate(dt)  --Update nebulainn mín.
	planetupdate(dt) -- planetan að færa sig
	particleupdate(dt)
	
    hond:update(dt)
	timer = timer + 1*dt   --Timer-inn í leiknum
	
	
	if utmork_planetu < 2600 then
	    while ond_upp < 40 do
	        ond_upp = ond_upp + 2*dt
		end
		while ond_down < 20 do
		    ond_down = ond_down + 2*dt
		end
		
	    ond_y = ond_y + ond_speed*dt
	    if love.mouse.isDown("l") then   --movement í þyngdarafli
	        ond_speed = ond_speed - ond_upp*dt 
		    ond_rot = ond_rot - 0.15*dt
	    else
	       ond_speed = ond_speed + ond_down*dt
		   
		if ond_rot < 3.14 then
            ond_rot = ond_rot + 0.15*dt
		end
	    end
	else
	    if love.mouse.isDown("l") then
	        if my > ond_y and ond_y < 290 then  --movement sytem i engu þyngdarafli
		        ond_y = ond_y + 50*dt
		    end
		    if my < ond_y and ond_y > 20 then
		        ond_y = ond_y - 50*dt
		    end
		end
	end
	
	--lengd = math.sqrt((rak_x - ond_x) * (rak_x - ond_x) + (rak_y - ond_y) * (rak_y - ond_y))
	
	--if circlecollision(ond_x, ond_y, rak_x, rak_y, (ond:getWidth()/5)*0.60, ond:getHeight()*0.60, raketta:getWidth()*0.05, raketta:getHeight()*0.05) == true then	--set in tölur og fæ true ef collision er en false ef ekki
	--    love.audio.play(quack)
    --    paused = true
   -- end

end

function love.draw()
    
	love.graphics.setFont(font)

	nebulateikna()
    --love.graphics.circle("fill", ond_x, ond_y - 6, ond:getHeight()*0.2, 16)  --Nákvæmlega sömu tölur og í collision formúlunni, hring með dama radius þá get ég séð árekstarsvæðin!
    love.graphics.print(maxi, 30, 25)
	love.graphics.print(mx, 250, 25)
	love.graphics.print(my, 310, 25)
		
	planetteikna()
	particleteikna()
	asteroidsdraw()
	hugsdraw()
	hond:draw(ond_x, ond_y, ond_rot, 0.7, 0.7, 60, 44)
	flipiaction()
	
	
end

function love.mousepressed(x, y, button)

	if button == "l" and x > 200 and x < 325 and y < flipi_y + 25 and y > flipi_y - 10 then
	    onoff = onoff + 1
	end
	
	if button == "l" and x > 180 and x < 300 and y > 100 and y < 160 and reset_takki % 2 == 0  then  --RESET TAKKINN
	    reset = true
		reset_takki = reset_takki + 1
	end
	
	if button == "l" and x > flipi_x + 60 and x < flipi_x + 220 and y <	flipi_y - 170  then   --HÆTTA TAKKINN
	    love.event.quit()
    end
end	


--siggga norrre teststets  GITHUB


