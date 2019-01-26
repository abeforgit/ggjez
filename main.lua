local Scene = require("src.scene")
local Player = require("src.player")
local EnemyDeath = require("src.enemyDeath")
local EnemyError = require("src.enemyError")
local TowerA = require("src.towerA")
local TowerB = require("src.towerB")


function love.load()
    scn = Scene:new()
    local player = Player:new()
    love.mousereleased = player:mousereleased()
    love.handlers.keypressed = player:keypressed()
    love.keyreleased = player:keyreleased()
    love.mousepressed = player:mousepressed()
 
    scn:addActor(player)
    scn:addActor(EnemyDeath:new(player))
    scn:addActor(EnemyError:new(player))
    scn:addActor(TowerA:new(), 250, 250)
    scn:addActor(TowerB:new(), 0, 250)
end

function love.update(dt)
    scn:update(dt)
end

function love.keypressed(key)
end

function love.draw(dt)
    scn:draw()
end

