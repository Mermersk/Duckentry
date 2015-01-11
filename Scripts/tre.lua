--Skógurinn

function treload()

    tre = love.graphics.newImage("Resources/tre.png")

	trefjoldi = {}
	for i = 0, 35 do
	    trefjoldi[i] = {tre_x = love.math.random(-2, 600), tre_y = love.math.random(100, 300), tre_scale = love.math.random(30, 55)/100}
	end
	
	skog_x = 0 --original = 0
	skog_y = 400 --original = 500 
	tretimer = 0
	
	skog = love.graphics.newCanvas(600, 300)  --Búa til canvas þar sem að skógurinn verður teiknaður á.
	
end

function treupdate(dt)
    tretimer = tretimer + 1*dt
    for lykill, gildi in pairs(trefjoldi) do
	    if tretimer < vatnstart  then
	        gildi.tre_x = gildi.tre_x - 40*dt
		end
		
		if gildi.tre_x < -170 and tretimer < vatnstart - 3  then --Svo að vatnið geti komið, -3 svo að við sjáum aldrei bara hálft tré.
		    gildi.tre_x = love.math.random(520, 600)
			gildi.tre_y = love.math.random(100, 300)
			gildi.tre_scale = love.math.random(30, 55)/100
		end
		
    end
	
	if tretimer > 3 and skog_y < 110 and tretimer + 5 < vatnstart  then  --60 , 53
	    skogr, skogg, skogb, skoga = skog:getPixel(ond_x, ond_y - 22)
	end
	
    skog:clear() -- Þetta er notað til að hreinsa allt sem er ekki beint i draw á canvas. með þessu er hægt að hafa newCanvas bara í load! Ef þetta væri ekki þá myndi tréið skilja eftir sig græna slóð þegar það hreyfist.
	
	if utmork_planetu < 800 and skog_y > 40 then  --lætur skóginn risa upp
	    skog_y = skog_y - 9*dt
	end
	
    if skog_y < 103 and skoga > 200  then  --collision detection
	    lifteljari = lifteljari + 1  --collision response
		reset_takki = reset_takki + 1
		ond_y = 20
	end
	
	if tretimer > vatnstart  then --Færa skóginn svo að vatnið komi í staðinn!
	    skog_x = skog_x - 40*dt
	end
	
	
end

function tredraw()

    love.graphics.draw(skog, skog_x, skog_y)
	
end

function canvasdrawtre()

    love.graphics.setCanvas(skog)
	for lykill, gildi in pairs(trefjoldi) do
	    love.graphics.draw(tre, gildi.tre_x, gildi.tre_y, 0, gildi.tre_scale, gildi.tre_scale)
	end
	love.graphics.setCanvas()
    
end


