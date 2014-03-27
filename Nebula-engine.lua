
function nebulahlada()
    nebulas = {
	{nebulat = nebula(love.math.random(14, 28)), rammi_x = love.math.random(500, 600), rammi_y = love.math.random(-250, 175), rammi_speed = love.math.random(15, 30), rammi_scale = love.math.random(5, 12)/10},
	{nebulat = nebula(love.math.random(14, 28)), rammi_x = love.math.random(500, 620), rammi_y = love.math.random(-250, 175), rammi_speed = love.math.random(15, 30), rammi_scale = love.math.random(5, 12)/10},
	{nebulat = nebula(love.math.random(14, 28)), rammi_x = love.math.random(500, 580), rammi_y = love.math.random(-250, 175), rammi_speed = love.math.random(15, 37), rammi_scale = love.math.random(5, 12)/10}
	
	}
	
	
end


function nebulaupdate(dt)

    for lykill, gildi in pairs(nebulas) do
        gildi.rammi_x = gildi.rammi_x - gildi.rammi_speed*dt
		
		if gildi.rammi_x < -450 then
		    gildi.rammi_x = love.math.random(550, 680)
            gildi.rammi_y = love.math.random(-250, 175)
            gildi.rammi_speed = love.math.random(15, 30)
            gildi.nebulat = nebula(love.math.random(14, 30))
			gildi.rammi_scale = love.math.random(5, 12)/10
        end			
	end

end

function nebulateikna()

    for lykill, gildi in pairs(nebulas) do
	    love.graphics.setColor(255, 255, 255, 50)
        love.graphics.draw(gildi.nebulat, gildi.rammi_x, gildi.rammi_y, 0, gildi.rammi_scale, gildi.rammi_scale)  --teikna nebulaið
	    love.graphics.setColor(255, 255, 255, 255)
	end
	

end


function nebula(circles)  --Nebula creator!!! circles = þykkni nebulans, rammi_x og rammi_y hvar á að teikna nebulað í leiknum ?
    
	neb = {}
	
    for i = 1, circles do
	    neb[i] = {x = love.math.random(100, 300), y = love.math.random(100, 300), ra = love.math.random(70, 90), v = love.math.random(50, 60), a = love.math.random(10, 190)}
    end		

	r = love.math.random(0, 255)
	g = love.math.random(0, 255)
	b = love.math.random(0, 255)
	
	rammi = love.graphics.newCanvas(400, 400)
	
	love.graphics.setCanvas(rammi)
	    rammi:clear()
	    love.graphics.setBlendMode("alpha")
	    for lykill, gildi in pairs(neb) do
	        love.graphics.setColor(r, g, b, gildi.a)
	        love.graphics.circle("fill", gildi.x, gildi.y, gildi.ra, gildi.v)
		    love.graphics.setColor(255, 255, 255)
	    end
	love.graphics.setCanvas()
	
	return rammi
end