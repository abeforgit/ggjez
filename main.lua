local Scene = require("src.scene")
local Player = require("src.player")
local EnemyDeath = require("src.enemyDeath")
local EnemyError = require("src.enemyError")
local Tower = require("src.tower")


function love.load()
    scn = Scene:new()
    local player = Player:new()
    love.mousereleased = player:mousereleased()
    love.handlers.keypressed = player:keypressed()
    love.keyreleased = player:keyreleased()
    love.mousepressed = player:mousepressed()
 
    scn:addActor(player)
    scn:addActor(EnemyDeath:new(player), 250, 0)
    scn:addActor(EnemyError:new(player),0, 250)
    scn:addActor(Tower:new(250, 250), 250, 250)
end

function love.update(dt)
    scn:update(dt)
end

function love.keypressed(key)
end

function love.draw(dt)
    scn:draw()
end

