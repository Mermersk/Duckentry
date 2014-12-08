--Vatn

function vatnload()

    width = 500
	height = 400
	punktar = {{x = width, y = height, upp_eda_nidur = love.math.random(-5, 5)},
	           {x = 0, y = height, upp_eda_nidur = love.math.random(-5, 5)},
			   {x = 1, y = 200, upp_eda_nidur = love.math.random(-5, 5)},
			   {x = 32, y = 200, upp_eda_nidur = love.math.random(-5, 5)},
			   {x = 32*2, y = 200, upp_eda_nidur = love.math.random(-5, 5)},
			   {x = 32*3, y = 200, upp_eda_nidur = love.math.random(-5, 5)},
			   {x = 32*4, y = 200, upp_eda_nidur = love.math.random(-5, 5)},
			   {x = 32*5, y = 200, upp_eda_nidur = love.math.random(-5, 5)},
			   {x = 32*6, y = 200, upp_eda_nidur = love.math.random(-5, 5)},
			   {x = 32*7, y = 200, upp_eda_nidur = love.math.random(-5, 5)},
			   {x = 32*8, y = 200, upp_eda_nidur = love.math.random(-5, 5)},
			   {x = 32*9, y = 200, upp_eda_nidur = love.math.random(-5, 5)},
			   {x = 32*10, y = 200, upp_eda_nidur = love.math.random(-5, 5)},
			   {x = 32*11, y = 200, upp_eda_nidur = love.math.random(-5, 5)},
			   {x = 32*12, y = 200, upp_eda_nidur = love.math.random(-5, 5)},
			   {x = 32*13, y = 200, upp_eda_nidur = love.math.random(-5, 5)},
			   {x = 32*14, y = 200, upp_eda_nidur = love.math.random(-5, 5)},
			   {x = 32*15, y = 200, upp_eda_nidur = love.math.random(-5, 5)},
			   {x = 32*16, y = 200, upp_eda_nidur = love.math.random(-5, 5)}
	                             }
	vatn = love.graphics.newCanvas(width, height)  --500x 400
	vatn_x = -1
    vatn_y = 200

	vatnstart = 100
	
	fond = love.graphics.newImage("Resources/fond.png")
	fondung = love.graphics.newImage("Resources/fondung.png")
end

function vatnupdate(dt)

    for lykill, gildi in pairs(punktar) do
	 
		if gildi.y > 205 then
		    gildi.upp_eda_nidur = love.math.random(-5, -3) --Setja ölduna upp aftur
		end
		if gildi.y < 195 then
		    gildi.upp_eda_nidur = love.math.random(3, 5) --setja ölduna niður aftur
		end
		
		gildi.y = gildi.y + gildi.upp_eda_nidur*dt
	end  

	--akkera neðstu gildin, neðstu punktarnir á kassanum
	punktar[1].x = width
	punktar[1].y = height
	punktar[2].x = 0
	punktar[2].y = height
	
	vatn:clear()
 
    if tretimer > vatnstart and vatn_y > 40 then  --Þegar þessi skilyrðu eru sett fer vatnið upp á skjáinn svo það sjáist, --athugið, tretimer er 57 sekunda gamall þegar skógruinn kemur
        --vatn_x = vatn_x - 40*dt --Vatnið kemur inn á hliðinni
		vatn_y = vatn_y - 6*dt
	end
end

function vatndraw()

    love.graphics.setCanvas(vatn)
    love.graphics.setColor(47, 79, 150)
	for i = 1, 19 do
	    love.graphics.polygon("fill", punktar[1].x, punktar[1].y,
                                      punktar[2].x, punktar[2].y,
									  punktar[3].x, punktar[3].y,
									  punktar[4].x, punktar[4].y,
									  punktar[5].x, punktar[5].y,
									  punktar[6].x, punktar[6].y,
									  punktar[7].x, punktar[7].y,
									  punktar[8].x, punktar[8].y,
									  punktar[9].x, punktar[9].y,
									  punktar[10].x, punktar[10].y,
									  punktar[11].x, punktar[11].y,
									  punktar[12].x, punktar[12].y,
									  punktar[12].x, punktar[12].y,
									  punktar[13].x, punktar[13].y,
									  punktar[14].x, punktar[14].y,
									  punktar[15].x, punktar[15].y,
									  punktar[16].x, punktar[16].y,
									  punktar[17].x, punktar[17].y,
									  punktar[18].x, punktar[18].y,
									  punktar[19].x, punktar[19].y
									  )
	end
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.draw(fond, punktar[11].x, punktar[11].y, 0, 0.3, 0.3, 500/2, 350/2)
	love.graphics.draw(fondung, punktar[13].x, punktar[13].y, 0, 0.1, 0.1, 400/2, 270/2)
	love.graphics.draw(fondung, punktar[14].x, punktar[14].y, 0, 0.1, 0.1, 400/2, 270/2)
	love.graphics.setCanvas()
	--love.graphics.print(punktar[19].y)
	love.graphics.draw(vatn, vatn_x, vatn_y)

	
	

end