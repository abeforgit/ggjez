Scene = require("src.scene")

function love.load()
    scn = Scene:new()
end

function love.update(dt)
    scn:update(dt)
end

function love.keypressed(key)
end

function love.draw(dt)
    scn:draw()
    
end
