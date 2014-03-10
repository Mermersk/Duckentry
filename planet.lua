
function planethlada()

    planet_move = false
	planet_x = 3700
	planet_y = 3000
	
end

function planetupdate(dt)

	if planet_move == true then
	    planet_x = planet_x - 20*dt
		planet_y = planet_y - 13*dt
	end
end
	
function planetteikna()

    if timer > 5 then
	    planet(30, 150, 60, 2, 200, 150)  --hringir, circle_size, alpha_start, alpha_decrease
		planet_move = true
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

	
	for lykill, gildi in pairs(cir) do  --annars get ég ekki breytt planet_x og planet_y
	    love.graphics.setColor(135, 206, 250, gildi.alpha)   --0, 191, 255
        love.graphics.circle("fill", planet_x, planet_y, gildi.radius, 1500)
		love.graphics.setColor(255, 255, 255, 255)
	end
	
	
	
end