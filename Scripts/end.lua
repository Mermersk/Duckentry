--Real end

function endload()

    endtimi = 25  --endtimi er timinn frá því að vatnið kemur upp og að ending cutscenið byrjar!
	
	stadsetning = 0
    diffrud_x = 0
	diffrud_y = 0
	endstart = false
	
	hjarta = {}
	hjartamynd = love.graphics.newImage("Resources/hjarta.png")
	hjartatimi = 1
	hjarta = {}
	for i = 1, 200 do
		hjarta[i] = {x = love.math.random(ond_x + 90, ond_x + 150), y = love.math.random(ond_y - 20, ond_y), rot = love.math.random(0, 10)/10, scale = love.math.random(2, 3)/15, timi = i}
	end
	
	
	flute = love.audio.newSource("Resources/Telemann flute2.ogg")
	bibi = love.audio.newSource("Resources/bibi.ogg")
	tween_volume = 0 
	hjortu = 0
	
end   

function endupdate(dt)
    
	if ond_y > 75 and ond_y < 110 then
	    endstart = true
	end
		
	kurva = love.math.newBezierCurve(75, 100, 200, 5, 400, 40, 400, 120, 75, 170, 25, 210, 100, 240, punktar[9].x, punktar[9].y + 30)
	stad_x, stad_y = kurva:evaluate(stadsetning)
	coords = kurva:render(10)
	
	diffrud_kurva = kurva:getDerivative()
	diffrud = kurva:render(10)
	diffrud_x, diffrud_y = diffrud_kurva:evaluate(stadsetning)
	
	langhlid = pyth(stad_x, diffrud_x, stad_y, diffrud_y)
	x_hlid = stad_x - diffrud_x  --aðlæg hlið
	y_hlid = stad_y - diffrud_y --mótlæg hlið
	horn_x_a_milli_klikkid_og_kulunnar = x_hlid/langhlid 
	horn_y_a_milli_klikkid_og_kulunnar = y_hlid/langhlid
    
    

   if stadsetning > 0.95 then --Setja öndina á vatnið þegar bezierkurvan er búinn
       love.audio.stop(vuff)
       ond_x = punktar[8].x
       ond_y = punktar[8].y + 30
	   ond_rot = 3.14
	   hond:seek(2)  --seek stoppar animationið bara á einu frame-i! hond er 5 frame animation.
	   else if endstart == true then
	   love.audio.stop(vuff)
	   ond_x = stad_x
       ond_y = stad_y
	   hond:seek(2)  --seek stoppar animationið bara á einu frame-i! hond er 5 frame animation.
	   stadsetning = stadsetning + 0.08*dt
	   --ond_rot = horn_x_a_milli_klikkid_og_kulunnar - 1
	   if stadsetning > 0.29 then
	       ond_rot = 0
		   --ond_x_scale = -0.7  --Gerir spegilmynd!
		   ond_y_scale = -0.7 --Gerir spegilmynd!
	   end
	   if stadsetning > 0.80 then  
	       ond_rot = 3.14
		  -- ond_x_scale = 0.7
		   ond_y_scale = 0.7
	   end
	   end
    end	
	
	if ond_x == punktar[8].x then
	    --hjortu = hjortu + (1/3)*dt
        
	    --if hjortu = hjortu + (1/3)*dt then
	        --table.insert(hjarta, {x = love.math.random(ond_x + 10, ond_x + 70), y = love.math.random(ond_y - 70, ond_y - 30), rot = love.math.random(0, 10)/10, scale = love.math.random(2, 3)/15})
	    --end
		
        --for lykill, gildi in pairs(hjarta) do
            --gildi.y = gildi.y - 15*dt
		--end
		for i = 1, math.floor(hjortu) do  --Lætur hjörtin fara upp í sömu röð og þau eru teiknuð!
		    hjarta[i].y = hjarta[i].y - 15*dt
		end
		    
    end
	
	if hjortu > 8 and hjortu < 8.15 then  --storifugl
	    kakk:setVolume(0.5)
		love.audio.play(kakk)
	end
	if hjortu > 4 and hjortu < 4.2 then  --litlifuglar
	    love.audio.play(bibi)
	end
	
	if stadsetning > 0.1 and stadsetning < 0.3 then  --Spila endalag
	    play_tweening_up(dt, flute)
	end
	
	if hjortu > 13 and hjortu < 14.5 then  --Fæ upp credit skjáinn.
	    credit_teljari = 2
		onoff = 0
	end
   

end

function enddraw()

    --love.graphics.draw(fugl, stad_x, stad_y, horn_x_a_milli_klikkid_og_kulunnar, 0.6, 0.6, 95/2, 54/2)
	--love.graphics.circle("fill", diffrud_x, diffrud_y, 10, 24)
    --love.graphics.line(coords)
	--love.graphics.line(diffrud)
	--love.graphics.print(#punktar)
	--love.graphics.print(horn_x_a_milli_klikkid_og_kulunnar, 200, 5)
    
	love.graphics.setColor(167, 120, 115)
	love.graphics.polygon("fill", 130, 75, 130, 110, 100, 92.5) 
	love.graphics.rectangle("fill", 130, 75, 60, 35)  --(x, y, width, height)
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.setFont(font2)
	love.graphics.print("Land", 130, 75)
	--love.graphics.print(ond_x)
	    
end

function hjartadraw()

    for lykill, gildi in pairs(hjarta) do
	    if ond_x == punktar[8].x then  --Hjartaanimation af stað
		    if hjortu > gildi.timi then  --Teiknar hjörtu 1 uppi 20 á 3 sekunda fresti, þvi að breytan hjortu tekur 3 sekúndur að bæta við sig 1 sekúndu
		        love.graphics.draw(hjartamynd, gildi.x, gildi.y, 0, gildi.scale, gildi.scale)
			end
		end
	end
	
end

function pyth(x1, x2, y1, y2)  --Pýþagóras functionið, get þá gert hvar sem er pyth(x-hnit hlutars 1, x-hnit hlutars 2, y-hnit hlutars 1, y-hnit hlutars 2) og fengið út lengdina á mili þeirra!
    return math.sqrt((x1 - x2)*(x1 - x2) + (y1 - y2)*(y1 - y2))
end

--Fróðleiksmoli
--[[
-- normal
love.graphics.draw(image, x, y, rotation, 1, 1) 

-- mirror
love.graphics.draw(image, x, y, rotation, -1, 1) 

-- flipped
love.graphics.draw(image, x, y, rotation, 1, -1)

                                                             ]]
															 
function play_tweening_up(dt, piece) --setur hljóðið á og fer hægt upp, dt út af því að þetta er ú love.update, svo að functionið viti að ég meina delta time.
      --Nota þetta til að segja að tween_volume er 0 BARA EINU SINNI, ef ég setti bara tween_volume = 0, þá væri það alltaf núll sama hvað ég geri

	love.audio.play(piece)
	if tween_volume < 1 then
	    tween_volume = tween_volume + 0.02*dt
	end
	piece:setVolume(tween_volume)
	
end



   


