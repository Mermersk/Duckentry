function love.conf(t)
    
	kerfi = love._os
  
	if kerfi == "Android" then
        t.window.width = 480
        t.window.height = 320
	    t.title = "Duckentry" 
        t.author = "Mermersk"
	end
	
	if kerfi == "Windows" then
	    t.window.width = 0
		t.window.height = 0
		t.title = "Duckentry" 
        t.author = "Mermersk"

	end
	
end