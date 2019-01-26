local Scene = require("src.scene")
local TitleScreen = require("src.titleScreen")
local WarningScreen = require("src.warningScreen")
local Player = require("src.player")
local EnemyDeath = require("src.enemyDeath")
local EnemyError = require("src.enemyError")
local TowerA = require("src.towerA")
local TowerB = require("src.towerB")


function love.load()
    scn = WarningScreen:new()
    love.mousereleased = scn:mousereleased()
    love.keypressed = scn:keypressed()
    love.keyreleased = scn:keyreleased()
    love.mousepressed = scn:mousepressed()
 
end

function love.update(dt)
    scn:update(dt)
end

function love.keypressed(key)
end

function love.draw(dt)
    scn:draw()
end

