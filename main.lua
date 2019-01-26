local Scene = require("src.scene")
local Player = require("src.player")
local EnemyDeath = require("src.enemyDeath")
local EnemyError = require("src.enemyError")
local Tower = require("src.tower")

player = Player:new()
love.mousereleased = player.mousereleased
love.keypressed = player:keypressed()
love.keyreleased = player:keyreleased()

function love.load()
    scn = Scene:new()
    player = Player:new()
    love.mousereleased = player.mousereleased
    love.handlers.keypressed = player:keypressed(player)
    love.keyreleased = player:keyreleased()

    love.mousepressed = player.mousepressed
 
    scn:addActor(player)
    scn:addActor(EnemyDeath:new(player))
    scn:addActor(EnemyError:new(player))
end

function love.update(dt)
    scn:update(dt)
end

function love.keypressed(key)
end

function love.draw(dt)
    scn:draw()
end

