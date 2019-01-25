Tower = require("src.tower")

function love.load()
    tower = Tower:new()
end

function love.update(dt)
    tower:update(dt)
end

function love.keypressed(key)
end

function love.draw(dt)
    tower:draw(dt)
end
