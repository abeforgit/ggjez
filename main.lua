local Scene = require("src.scene")
local Player = require("src.player")
local EnemyDeath = require("src.enemyDeath")
local EnemyError = require("src.enemyError")
local TowerA = require("src.towerA")
local TowerB = require("src.towerB")


function love.load()
    scn = Scene:new()
    love.mousereleased = scn:mousereleased()
    love.keypressed = scn:keypressed()
    love.keyreleased = scn:keyreleased()
    love.mousepressed = scn:mousepressed()
 
    scn:addActor(EnemyDeath:new(player), 250, 0)
    scn:addActor(EnemyError:new(player),0, 250)
    scn:addActor(TowerA:new(), 250, 250)
end

function love.update(dt)
    scn:update(dt)
end

function love.keypressed(key)
end

function love.draw(dt)
    scn:draw()
end

