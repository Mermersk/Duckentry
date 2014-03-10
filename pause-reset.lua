--Pause thingy

function flipihlada()
    flipi = love.graphics.newImage("flipi.png")
	kassi = love.graphics.newImage("kassi.png")
	flipi_x = 200    
	flipi_y = 249
	paused_text = "Start"
	paused = true

	onoff = 0
	reset_takki = 1
	
	lif = love.graphics.newImage("lif.png")
	lifteljari = 0
	
end

function flipiaction()
    
	if lifteljari < 0.5 then
	    love.graphics.draw(lif, 380, 5, 0, 0.3, 0.3)  --lif nr 1
	else
	    love.graphics.setColor(105, 105, 105)   --Þegar þetta keyrist þá er það líf notað! búið.
        love.graphics.draw(lif, 380, 5, 0, 0.3, 0.3)   
		love.graphics.setColor(255, 255, 255, 255)	
	end

	if lifteljari < 1.5 then
	    love.graphics.draw(lif, 410, 5, 0, 0.3, 0.3)   --lif nr 2
	else
	    love.graphics.setColor(105, 105, 105)
        love.graphics.draw(lif, 410, 5, 0, 0.3, 0.3) 
		love.graphics.setColor(255, 255, 255, 255)	
	end
	
	if lifteljari < 2.5 then
	    love.graphics.draw(lif, 440, 5, 0, 0.3, 0.3)  --lif nr 3
	else
	    love.graphics.setColor(105, 105, 105)  
        love.graphics.draw(lif, 440, 5, 0, 0.3, 0.3)
		love.graphics.setColor(255, 255, 255, 255)	
	end
	
	if lifteljari == 3 and love.mouse.isDown("l") and mx > 180 and mx < 300 and my > 100 and my < 160 then --Resetta functionið, hér byrjar leikurinn uppá nýtt
	    --GAME OVER SCHUUUULBOY, BYRJA UPPÁ NÝTT
	
		
		aster = {
	{ast_x = 750, ast_y = love.math.random(5, 320), ast_speed = love.math.random(25, 170), ast_snu = love.math.random(1, 20)/10, ast_start = 0},
	{ast_x = 750, ast_y = love.math.random(5, 320), ast_speed = love.math.random(25, 170), ast_snu = love.math.random(1, 20)/10, ast_start = 0},
	{ast_x = 800, ast_y = love.math.random(5, 320), ast_speed = love.math.random(25, 170), ast_snu = love.math.random(1, 20)/10, ast_start = 0},
	{ast_x = 820, ast_y = love.math.random(5, 320), ast_speed = love.math.random(25, 170), ast_snu = love.math.random(1, 20)/10, ast_start = 0}
	}
	
	    aster2 = {
	{ast_x = 800, ast_y = love.math.random(5, 320), ast_speed = love.math.random(70, 170), ast_snu = love.math.random(1, 20)/10, ast_start = 0},
	{ast_x = 800, ast_y = love.math.random(5, 320), ast_speed = love.math.random(70, 170), ast_snu = love.math.random(1, 20)/10, ast_start = 0},
	{ast_x = 769, ast_y = love.math.random(5, 320), ast_speed = love.math.random(70, 170), ast_snu = love.math.random(1, 20)/10, ast_start = 0},
	{ast_x = 790, ast_y = love.math.random(5, 320), ast_speed = love.math.random(70, 170), ast_snu = love.math.random(1, 20)/10, ast_start = 0}
	}
	
	nebulas = {
	{nebulat = nebula(love.math.random(14, 28)), rammi_x = love.math.random(550, 775), rammi_y = love.math.random(-250, 175), rammi_speed = love.math.random(15, 30), rammi_scale = love.math.random(5, 12)/10},
	{nebulat = nebula(love.math.random(14, 28)), rammi_x = love.math.random(550, 800), rammi_y = love.math.random(-250, 175), rammi_speed = love.math.random(15, 30), rammi_scale = love.math.random(5, 12)/10},
	{nebulat = nebula(love.math.random(14, 28)), rammi_x = love.math.random(550, 750), rammi_y = love.math.random(-250, 175), rammi_speed = love.math.random(15, 37), rammi_scale = love.math.random(5, 12)/10}
	}
	
	    	
		ond_x = 75
        ond_y = 150
	    ond_rot = 3.14
	    ond_speed = 20
	
		timer = 0
		flipihlada()
	    hugshlada()
		reset = false
		
		snu = 0
	    snu2 = 0
		
		planet_move = false
	    planet_x = 3700
	    planet_y = 3000
		
		lifteljari = 0
		hugs(10, 10, hugs1) 
	    hugs(25, 10, hugs2)
	    hugs(45, 10, hugs3)
	end


	
	
    love.graphics.draw(flipi, flipi_x, flipi_y, 0, 0.7, 0.7)
	love.graphics.setFont(font2) --teiknar allt her eftir í stóra fontinum
	love.graphics.print(paused_text, flipi_x + 37, flipi_y)
	
	love.graphics.setColor(255, 255, 255, 230)
	love.graphics.draw(kassi, flipi_x - 175, flipi_y - 360)   --love.graphics.rectangle("fill", flipi_x - 175, flipi_y - 360, 430, 350)
	love.graphics.setColor(255, 255, 255, 255)
	
	love.graphics.setColor(100, 1, 1)
	love.graphics.rectangle("fill", flipi_x + 50, flipi_y - 270, 180, 100)                                      --flipi_x + 100, flipi_y - 145, 75, 35)
	love.graphics.setColor(255, 255, 255)
	love.graphics.print("QUIT", flipi_x + 115, flipi_y - 233)
	
	--love.graphics.setColor(167, 120, 115)
	--love.graphics.rectangle("fill", flipi_x - 150, flipi_y - 270, 180, 100)
	--love.graphics.setColor(255, 255, 255)
	--love.graphics.print("Reset", flipi_x - 75, flipi_y - 233)
	
	
	if onoff % 2 == 0 then
	    paused = true
		paused_text = "Resume"
	else
	    paused = false
		paused_text = "Menu"
	end
	
	if paused == false and flipi_y > 9.5 then
	    flipi_y = flipi_y - 15
    end
    if paused == true and flipi_y < 250 then
	    flipi_y = flipi_y + 15
    end

    if reset_takki % 2 == 0 then
        paused = true
	    love.graphics.setColor(167, 120, 115)
	    love.graphics.rectangle("fill", 180, 100, 120, 60)
	    love.graphics.setColor(255, 255, 255)
		if lifteljari < 2.5 then
            reset_text = "Reset"
		else
		    love.graphics.setFont(font)  --Breyti í minna font þegar leikurinn er game-over til að rúma meiri texta
		    reset_text = "Game Over"
			love.graphics.print("Restart?", 210, 120) 
		end
	    love.graphics.print(reset_text, 210, 100)
		
		
		
		if lifteljari < 0.5 then
	        love.graphics.draw(lif, 190, 140, 0, 0.3, 0.3)  --lif nr 1
	    else
	        love.graphics.setColor(105, 105, 105)   --Þegar þetta keyrist þá er það líf notað! búið.
            love.graphics.draw(lif, 190, 140, 0, 0.3, 0.3)   
		    love.graphics.setColor(255, 255, 255, 255)	
	    end

	    if lifteljari < 1.5 then
	        love.graphics.draw(lif, 220, 140, 0, 0.3, 0.3)   --lif nr 2
	    else
	        love.graphics.setColor(105, 105, 105)
            love.graphics.draw(lif, 220, 140, 0, 0.3, 0.3) 
		    love.graphics.setColor(255, 255, 255, 255)	
	    end
	
	    if lifteljari < 2.5 then
	        love.graphics.draw(lif, 250, 140, 0, 0.3, 0.3)  --lif nr 3
	    else
	        love.graphics.setColor(105, 105, 105)  
            love.graphics.draw(lif, 250, 140, 0, 0.3, 0.3)
		    love.graphics.setColor(255, 255, 255, 255)			
	    end
		
	else
	  
	end	
	
end



    

