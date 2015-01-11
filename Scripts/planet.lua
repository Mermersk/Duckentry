
function planethlada()
    
    planet_move = false
	--planet_x = 3700
	--planet_y = 3000
	planet(30, 125, 80, 2.667) --Hér hleð ég inn plánetuna í load svo að allt laggi ekki.
	planet_x = 2000  --stærri stala hér = lengri timi til að plánetan komi
	planet_y = 2000  --  sama og uppi  --2000 rétta
end

function planetupdate(dt)

	if planet_move == true and planet_x > -2300 then  --planet_x > -2800 svo að plánetans stoppi eimmit í miðjunni á hringnum, kominn inn í lofthjúpinn!
	    planet_x = planet_x - 23*dt  --Færa plánetuna svo það lýti eins og öndin fari inn í hana
		planet_y = planet_y - 20*dt  --ATH ORIGINAL HRAÐI ER X-ÁS = 23 OG Y-ÁS = 20
	
	end
end
	
function planetteikna()

    if timer > 1 then  --Hér stilli ég hvenær plánetan kemur og allt það byrjar.
	    love.graphics.draw(planetan, planet_x, planet_y)  --Hér teikna ég svo canvasinn, en það er ekki kröfuhörð aðgerð þar sem að allt hefur verið reiknað í planethlada(), ef ég setti functionið bara beint hérna inn í love.draw þá væri hann alltaf að reikna endalaust = mikið lagg
		planet_move = true
	end
	
	if utmork_planetu > 2700 and utmork_planetu < 2850 then  --Varnarorð um að þyngdarafl er að fara taka við.
	    love.graphics.setColor(167, 120, 115)
		love.graphics.setFont(font2)
	    love.graphics.rectangle("fill", 195, 195, 100, 40)  
		love.graphics.setColor(255, 255, 255, 255)
		love.graphics.print("Gravity!", 200, 200)
		love.graphics.setFont(font2)
	end

end	


function planet(hringir, circle_size, alpha_start, alpha_decrease)  --Gufuhvols-vél, svone eitthvern megin (:

    cir = {}
	for i = 1, hringir do
        cir[i] = {radius = 2 + (i * circle_size) - circle_size, alpha = alpha_start + (i * -alpha_decrease) + alpha_decrease}  --Með alpahið, þá fer hvert gildi hærra um 2 ! ég geri -2 svo að fyrsta gildið byrji í 100, svo 102 og so on
    end
	
    --cir = {}
	--for i = 1, 20 do
        --cir[i] = {radius = 2 + (i * 400) - 40, alpha = 60 + (i * -3) + 3}  --Með alpahið, þá fer hvert gildi hærra um 2 ! ég geri -2 svo að fyrsta gildið byrji í 100, svo 102 og so on
    --end

	planetan = love.graphics.newCanvas(3070, 3070)
	love.graphics.setCanvas(planetan)
	planetan:clear()
	love.graphics.setBlendMode("alpha")
	for lykill, gildi in pairs(cir) do  --annars get ég ekki breytt planet_x og planet_y
	    love.graphics.setColor(0, 191, 255, gildi.alpha)   --0, 191, 255
        love.graphics.circle("fill", 2500, 2500, gildi.radius, 1500)  --Teikna þetta 3750 þar sem að það er miðjan á canvasinum!
		love.graphics.setColor(255, 255, 255, 255)
	end
	love.graphics.setCanvas()
	
	return planetan
	
end