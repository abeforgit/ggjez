Scene = require("src.scene")
Player = require("src.player")

function love.load()
    scn = Scene:new()
    scn:addActor(Player:new())
end

function love.update(dt)
    scn:update(dt)
end

function love.keypressed(key)
end

function love.draw(dt)
    scn:draw()
end
