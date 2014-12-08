--Pause thingy

function flipihlada()
    flipi = love.graphics.newImage("Resources/flipi.png")
	kassi = love.graphics.newImage("Resources/kassi.png")
	flipi_x = 200 
	flipi_y = 250 
	paused_text = "Start"
	paused = true

	onoff = 0
	reset_takki = 1
	
	lif = love.graphics.newImage("Resources/lif.png")
	lifteljari = 0
	about_draw = false
	
	credit_teljari = 1
	
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
	
	if lifteljari == 3 and love.mouse.isDown("l") and mx > 180 * scale_x and mx < 300 * scale_x and my > 100 and my < 160 then --Resetta functionið, hér byrjar leikurinn uppá nýtt
	    --GAME OVER SCHUUUULBOY, BYRJA UPPÁ NÝTT
	    resetgame()
	end


	
	
    love.graphics.draw(flipi, flipi_x, flipi_y, 0, 0.7, 0.7)
	love.graphics.setFont(font2) --teiknar allt her eftir í stóra fontinum
	love.graphics.print(paused_text, flipi_x + 37, flipi_y)
	
	love.graphics.setColor(255, 255, 255, 230)
	love.graphics.draw(kassi, flipi_x - 175, flipi_y - 360)   --love.graphics.rectangle("fill", flipi_x - 175, flipi_y - 360, 430, 350)
	love.graphics.setColor(255, 255, 255, 255)
	
	love.graphics.setColor(100, 1, 1)                --Þessi kóðaklasi teiknar QUIT takkan
	love.graphics.rectangle("fill", flipi_x + 50, flipi_y - 270, 180, 100)            
	love.graphics.setColor(255, 255, 255)
	love.graphics.print("QUIT", flipi_x + 115, flipi_y - 233)  
	
	love.graphics.setColor(167, 120, 115)                --Teikna RESTART takkann
	love.graphics.rectangle("fill", flipi_x - 140, flipi_y - 270, 180, 100)                                      --flipi_x + 100, flipi_y - 145, 75, 35)
	love.graphics.setColor(255, 255, 255)
	love.graphics.print("RESTART", flipi_x - 90, flipi_y - 233)
	
	love.graphics.setColor(167, 120, 115)                --Teikna CREDITS takkann
	love.graphics.rectangle("fill", flipi_x - 20, flipi_y - 165, 140, 60)                                      --flipi_x + 100, flipi_y - 145, 75, 35)
	love.graphics.setColor(255, 255, 255)
	love.graphics.print("ABOUT", flipi_x + 15, flipi_y - 155)
	
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
	
	if credit_teljari % 2 == 0 then
	    love.graphics.draw(credit_canvas, 25)
	end

	
end

function resetgame()  --functionið sem að Restartar leiknum svo að spilandi getur byrjað alveg uppá nýtt.
	
	  
		ond_x = 75
        ond_y = 150
	    ond_rot = 3.14
	    ond_speed = 20
	    hond:seek(1)
	
		timer = 0
		flipihlada()
	    hugshlada()
		reset = false
		
		snu = 0
	    snu2 = 0
		
		lifteljari = 0
		--hugs(10, 10, hugs1) 
	    hugs(30, 10, hugs2)
	    hugs(70, 10, hugs3)
		hugs(95, 10, hugs4)
		asteroidshlada()
		nebulahlada()
        planethlada()
	    skysoundshlada()
		vatnload()
		treload()
		endload()
		particlehlada()
		
		love.audio.stop()

end


    

