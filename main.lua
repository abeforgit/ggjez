Scene = require("src.scene")
Player = require("src.player")
Tower = require("src.tower")

function love.load()
    scn = Scene:new()
    scn:addActor(Player:new())
    scn:addActor(Tower:new())
end

function love.update(dt)
    scn:update(dt)
end

function love.keypressed(key)
end

function love.draw(dt)
    scn:draw()
end
