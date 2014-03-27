--Hugsin, hvernig Öndin tjáir sig.

function hugshlada()

    hugs1 = love.graphics.newImage("hugs1.png")
	hugs2 = love.graphics.newImage("hugs2.png")
	hugs3 = love.graphics.newImage("hugs3.png")
    quack1 = love.audio.newSource("duck1.ogg")
	quack1:setLooping(false)
	
	alpha = 0
	fade = true
end

function hugsdraw()
    
	--if timer > 10 and timer < 20 then
     --   love.graphics.draw(hugs1, ond_x + 40, ond_y - 120, 0, 0.4, 0.4)
	--	if timer > 10 and timer < 10.4 then
		--    love.audio.play(quack1)
	--	end
	--end
	
	--hugs(10, 10, hugs1) --functionið sem tekur við upplýsingum!
	hugs(30, 10, hugs2)
	hugs(70, 10, hugs3)
end

function hugs(start, hvelengi, mynd) --function til að auðvelda teikningu hugsanna, hvenær í leiknum það á að gerast

    if start < timer and start + hvelengi > timer and alpha < 246 then
	    alpha = alpha + 8
		fade = false
	else
	    fade = true
	end
	
	if start < timer and start + hvelengi + 2 > timer then --Annars teiknar hún bara allar hugsanir samtímis! + 2 þýðir að animationið fær 2 sek til að hverfa(alpha að lækka)
	    love.graphics.setColor(211, 211, 211, alpha)
		love.graphics.draw(mynd, ond_x + 40, mynd_y, 0, 0.4, 0.4)
		love.graphics.setColor(255, 255, 255, 255)
	end
	
	if fade == true and alpha > 0 then
	    alpha = alpha - 2
	end
	
	if start < timer and start + 0.5 > timer then
	    kakk:setLooping(false)
	    love.audio.play(kakk)
	end
	
	if ond_y - 120 > 0 then  --svo að myndin/hugsunin fari ekki út af skjánum þegar öndin er lengst uppi.
	    mynd_y = ond_y - 120
	else
	    mynd_y = 0
	end

end

--if alpha < 245 and start + hvelengi > timer then  --þetta er til að hugsunin komi svona hægt inn
		 --   alpha = alpha + 3
		 --   else if alpha > 240 and start + hvelengi -8 > timer then
		 --       alpha = alpha - 3
		--    end 
	--	end