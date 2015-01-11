--Learning Android development and make Duckentry!
require("Scripts.AnAL")
require("conf")
require("Scripts.pause-reset")
require("Scripts.hugsinn")
require("Scripts.asteroids-stars")
require("Scripts.Nebula-engine")
require("Scripts.planet")
require("Scripts.particles")
require("Scripts.opening-scene")
require("Scripts.sky-sounds")
require("Scripts.tre")
require("Scripts.vatn")
require("Scripts.end")

function love.load()
	love.window.setFullscreen(false)
	window_width, window_height = love.window.getDimensions()
	game_width = 480
	game_height = 320

	scale_x = window_width/game_width
	scale_y = window_height/game_height
	
    font = love.graphics.newFont("Resources/Dimbo Regular.ttf", 18) --Venjulegi
    font2 = love.graphics.newFont("Resources/Dimbo Regular.ttf", 30) --Stærri fonturinn
 
	ond = love.graphics.newImage("Resources/tond.png")
    hond = newAnimation(ond, 119, 88, 0.1, 0)
	ond_x = 75
	ond_y = 150
	ond_rot = 3.14
	ond_speed = 1
	ond_upp = 15
	ond_down = 15
	ond_x_scale = 0.7
	ond_y_scale = 0.7
	
	reset = false
	timer = 0
	
	opening_load()
    asteroidshlada() --asteroids hlaða allt inn
	flipihlada()
	hugshlada()
	nebulahlada()
	planethlada()
	particlehlada()
	skysoundshlada()
	treload()
	vatnload()
	endload()
	
	vuff = love.audio.newSource("Resources/vaengir-noiseremoved.ogg")
	vuff:setVolume(1.2)
	
	credit()
	
end

function love.update(dt)
   
	mx, my = love.mouse.getPosition()
	 
    maxi = love.graphics.getMaxImageSize()  --hæsta width/height sem mynd eða canvas má vera á tilteknu tæki
    things_that_must_run_independent_from_state_of_boolean_reset(dt)  --located in asteroids-stars.lua
	
    if reset == true then
	    return
	end
	
	if paused == true then
	    love.audio.pause() --Pása allt hljóð
	    return
	end
	
	particleupdate(dt)
	opening_action(dt)
	skysoundsupdate(dt)
	
	if utmork_planetu < 800 then
	    treupdate(dt)
	end
	if utmork_planetu < 1800 then  --Spila vængjaþýt
	    love.audio.play(vuff)
	end
	
	if tretimer > vatnstart then  --Til að spara vinnsluminni, annars verður þetta svo hægt á simanum!
	    vatnupdate(dt)
	  else
		planetupdate(dt)
	    nebulaupdate(dt)
		asteroidsupdate(dt) -- asteroidarnir og það sem þarf alltaf að hafa gætur á.  --Development
	end
	if tretimer > vatnstart + endtimi then
	    endupdate(dt)
	end
	
    hond:update(dt)
	
	timer = timer + 1*dt   --Timer-inn í leiknum
	
	if ond_y > 310 then  --svo að öndinn fljúgi ekki af skjánum að neðan, gefur ehnei örlitið boost uppávið. 
	    ond_speed = -2
	end
	if ond_y < 0 then  --Sama og uppi nema hér er efri hlutinn af skjánum
	    ond_speed = 2
	end
	
	if utmork_planetu < 2700 and endstart == false then  --seinna er til að disablea þetta kontrol system og láta bezierkurvunna koma í staðinn
	    while ond_upp < 40 do
	        ond_upp = ond_upp + 2*dt
		end
		while ond_down < 30 do
		    ond_down = ond_down + 2*dt
		end
		
	    ond_y = ond_y + ond_speed*dt
	    if love.mouse.isDown("l") then   --movement í þyngdarafli
		    ond_speed = ond_speed - ond_upp*dt 
		else  
	        ond_speed = ond_speed + ond_down*dt
		end
		
		if love.mouse.isDown("l") then  --rotation of da bird
		    ond_rot = ond_rot - 0.15*dt
		  else if ond_rot < 3.15 then
		      ond_rot = ond_rot + 0.15*dt
		  end
		end
	    
	else
	    if love.mouse.isDown("l") and timer > 6 then  --timer bara vegna opening cutscene!
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
    --love.graphics.scale(g_width/game_width, g_height/game_height)
	
	love.graphics.setFont(font)
    --love.graphics.print(kerfi)
	
    --love.graphics.circle("fill", ond_x, ond_y - 6, ond:getHeight()*0.2, 16)  --Nákvæmlega sömu tölur og í collision formúlunni, hring með dama radius þá get ég séð árekstarsvæðin!
    --love.graphics.print(maxi, 30, 25)
	--love.graphics.print(mx, 250, 25)
	--love.graphics.print(my, 310, 25)
	
	opening_draw()
	nebulateikna()
	planetteikna()
	particleteikna()
	asteroidsdraw()
	hjartadraw()

	if utmork_planetu < 800 then --skilyrði fyrir þvi hvenær skógurinn byrjar
	    tredraw()
	end
	hugsdraw()
	hond:draw(ond_x, ond_y, ond_rot, ond_x_scale, ond_y_scale, 60, 44)
	if tretimer > vatnstart then  --tretimer er breyta sem fer í gang þegar skógurinn sést á skjánum
	    vatndraw()  --athugið, tretimer er 57 sekunda gamall þegar skógruinn kemur
	end
	if tretimer > vatnstart + endtimi and endstart == false then
	    enddraw()  --Eina hér er skilaboðin um hvar þú átt að fara til að hefja lendingu
	end
	skysoundsdraw()
	
	flipiaction()
	
	--love.graphics.print(hjortu, 5, 100)
	--love.graphics.print(flipi_y + 35 * scale_y)
	--love.graphics.print(utmork_planetu, 1, 50)
	--love.graphics.print(skog_y, 1, 100)
	
	
end

function love.mousepressed(x, y, button)
    --love.graphics.scale(g_width/game_width, g_height/game_height)
    --love.graphics.scale(2, 2)

	if button == "l" and x > 200 and x < 325 and y < flipi_y + 35 and y > flipi_y - 10 then  --Resume/Menu takkinn
	    onoff = onoff + 1
		if credit_teljari % 2 == 0 then  --Aðeins hækkar talan ef credit_screenið er opið
		    credit_teljari = credit_teljari + 1
		end
	end
	
	if button == "l" and x > 180 and x < 300 and y > 100 and y < 160 and reset_takki % 2 == 0  then  --RESET TAKKINN Birtist þegar þú klessir á loftstein, 3 líf.
	    reset = true
		reset_takki = reset_takki + 1
	end
	
	if button == "l" and x > flipi_x + 60 and x < flipi_x + 220 and y <	flipi_y - 170 then   --HÆTTA TAKKINN
	    love.event.quit()
    end
	
	if button == "l" and x > flipi_x - 140 and x < flipi_x + 40 and y < flipi_y - 170 then  --RESTART takkinn
	    resetgame()
	end
	
	if button == "l" and x > flipi_x - 20 and x < flipi_x + 120 and y > flipi_y - 165 and y < flipi_y - 105 then  --CREDITS takkinn
	    credit_teljari = credit_teljari + 1 
	end

	
end	

function credit()

    credit_mynd = love.graphics.newImage("Resources/credit.png")
    credit_canvas = love.graphics.newCanvas(430, 350)
    love.graphics.setCanvas(credit_canvas)
	    love.graphics.draw(credit_mynd, 0, 0, 0, 1, 0.70)
		love.graphics.setFont(font2)
		love.graphics.print("Programming, art, sound and", 25, 5)
		love.graphics.print("game design by: Ísak Steingrímsson", 25, 45)
		love.graphics.print("Contact: ic4ruz39@gmail.com", 25, 85)
		love.graphics.print("Ending song by: G.P. Telemann", 25, 125)
		love.graphics.print("Made with:", 125, 155)
	love.graphics.setCanvas()


end

--monkeypatch starts here
local love_draw = love.draw --store original draw callback
love.draw = function() --overwrite draw callback
	local width,height = love.window.getDimensions()
	local original_width = 480
	local original_height = 320
	local sx,sy = width/original_width,height/original_height
	
	--coordinate system transformation functions only affect love.graphics drawing calls
	love.graphics.push() --store current coordinate transformation
	canvasdrawtre() --Hér teikna ég allt á canvasið, trein, svo hér fyrir neðan scaleast functionið tredraw() en það teiknar bara canvasið itself. Scalar þá bara vanvasið en ekki það sem er í canvasinu lika! Gallin áður var að það "scaleaði" trein og svo canvasið semsagt 2! sem gengur ekki.
	canvasdrawvatn()
	
	love.graphics.scale(sx,sy) --scale coordinate system
	love_draw() --call original draw callback
	love.graphics.pop() --restore current coordinate transformation
end



local love_mousepressed = love.mousepressed --store original mousepressed callback
love.mousepressed = function(x,y,button) --overwrite mousepressed callback
	local width,height = love.window.getDimensions()
	local original_width = 480
	local original_height = 320
	local sx,sy = width/original_width,height/original_height
	love_mousepressed(x/sx,y/sy,button) --call original mousepressed callback with scaled coordinates
end

local mouse_getPosition = love.mouse.getPosition
    love.mouse.getPosition = function()
    local width, height = love.window.getDimensions()
	local original_width = 480
	local original_height = 320
	local sx, sy = width/original_width, height/original_height
	x, y = mouse_getPosition()
	x = x/sx
	y = y/sy
	return x, y
end

	
	
	
--monkeypatch ends here 


