--Opening "cutscene"

function opening_load()

    bil = 25
	alpha_opening = 250
	
	zzz = {}
	for i = 1, 5 do
	    zzz[i] = {x = love.math.random(120, 170), y = -30 - (i * bil), rot = love.math.random(0, 10)/10, r = love.math.random(0, 255), g = love.math.random(0, 255), b = love.math.random(0, 255), timi = i/2}
	end
	
end

function opening_action(dt)

    
	if timer < 6 then
	    alpha_opening = 250
		hond:stop()
	else if timer > 6 and alpha_opening > 2 then
	    alpha_opening = alpha_opening - 50*dt 
	    hond:play()
	  end
	end
   

end

function opening_draw()
	
	if onoff == 1 then --þegar onoff = 1 þá er búið að ýta á resume einu sinni! svo þegar næst er ýtt á menu er onoff = 2 og so on.....
	    for lykill, gildi in pairs(zzz) do
	        if timer > gildi.timi then  --timi í töflunni er að hvert {x.....} teiknast í röð, timi er frá 1 til 5 svo nýr "z" bókstafur birtist hverja sekúndu
	            love.graphics.setColor(gildi.r, gildi.g, gildi.b, alpha_opening)
				love.graphics.setFont(font2)
                love.graphics.print("ZZZ?", gildi.x, ond_y + gildi.y, gildi.rot)
	            love.graphics.setColor(255, 255, 255)
	        end
        end
    end
	
	
end