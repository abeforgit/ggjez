local SceneGame = require("src.sceneGame")
local Scene = require("src.scene")
local Class = require("lib.hump.class")

local SceneTitle = Class{__includes = Scene}

SceneTitle.playButton = nil
SceneTitle.quitButton = nil
SceneTitle.width = nil
SceneTitle.height = nil
SceneTitle.playButtonX = nil
SceneTitle.playButtonY = nil
SceneTitle.quitButtonX = nil
SceneTitle.quitButtonY = nil

function startGame()
    scn = SceneGame()
    love.mousereleased = scn:mousereleased()
    love.keypressed = scn:keypressed()
    love.keyreleased = scn:keyreleased()
    love.mousepressed = scn:mousepressed()
    love.wheelmoved = scn:wheelmoved()
end

function quitGame()
    love.event.quit()
end

function SceneTitle:init()
    Scene.init(self, "Main Menu")
    love.graphics.setBackgroundColor(95 / 255, 205 / 255, 228 / 255)
    playButton = love.graphics.newImage("assets/play.png")
    quitButton = love.graphics.newImage("assets/quit.png")
    width = playButton:getWidth()
    height = playButton:getHeight()
end


function SceneTitle:draw()
    playButtonX = love.graphics.getWidth() / 2
    playButtonY = love.graphics.getHeight() / 2
    quitButtonX = love.graphics.getWidth() / 2 
    quitButtonY = love.graphics.getHeight() / 2 + 200
    love.graphics.draw(playButton, playButtonX , playButtonY, 0, 1, 1, width / 2, height / 2)
    love.graphics.draw(quitButton, quitButtonX, quitButtonY, 0, 0.5, 0.5, quitButton:getWidth() / 2, quitButton:getHeight() / 2)
end

function SceneTitle:update(dt)
end

function SceneTitle:mousereleased()
end

function SceneTitle:mousepressed()
    return function (x, y, button)
        if button == 1 then
            local dist = calculateDist(x, y, playButtonX, playButtonY)
            local r = playButton:getWidth()/2
            if dist < r then
                startGame()
                return nil
            end
            dist = calculateDist(x, y, quitButtonX, quitButtonY)
            r = quitButton:getWidth()/2
            if dist < r then
                quitGame()
                return nil
            end
        end
    end

end

function calculateDist(x, y, imgX, imgY)
    local diffX = x - imgX
    local diffY = y - imgY
    return math.sqrt(diffX * diffX + diffY * diffY)
end

function SceneTitle:keypressed()
end

function SceneTitle:keyreleased()
end

function SceneTitle:wheelmoved(key)
end

return SceneTitle