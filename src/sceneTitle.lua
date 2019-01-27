local SceneGame = require("src.sceneGame")
local Scene = require("src.scene")
local Class = require("lib.hump.class")

local SceneTitle = Class{__includes = Scene}

SceneTitle.playButton = love.graphics.newImage("assets/images/play.png")
SceneTitle.quitButton = love.graphics.newImage("assets/images/quit.png")
SceneTitle.width = nil
SceneTitle.height = nil
SceneTitle.playButtonX = nil
SceneTitle.playButtonY = nil
SceneTitle.quitButtonX = nil
SceneTitle.quitButtonY = nil

function quitGame()
    love.event.quit()
end

function SceneTitle:init(main)
    Scene.init(self, main, "Main Menu")
    love.graphics.setBackgroundColor(95 / 255, 205 / 255, 228 / 255)
    self.width = self.playButton:getWidth()
    self.height = self.playButton:getHeight()
    self:playSong(false)
end


function SceneTitle:draw()
    self.playButtonX = love.graphics.getWidth() / 2
    self.playButtonY = love.graphics.getHeight() / 2
    self.quitButtonX = love.graphics.getWidth() / 2 
    self.quitButtonY = love.graphics.getHeight() / 2 + 200
    love.graphics.draw(self.playButton, self.playButtonX , self.playButtonY, 0, 1, 1, self.width / 2, self.height / 2)
    love.graphics.draw(self.quitButton, self.quitButtonX, self.quitButtonY, 0, 0.5, 0.5, self.quitButton:getWidth() / 2, self.quitButton:getHeight() / 2)
end

function SceneTitle:mousepressed()
    return function (x, y, button)
        if button == 1 then
            local dist = calculateDist(x, y, self.playButtonX, self.playButtonY)
            local r = self.playButton:getWidth()/2
            if dist < r then
                self:setScene(SceneGame(self.main))
                return nil
            end
            dist = calculateDist(x, y, self.quitButtonX, self.quitButtonY)
            r = self.quitButton:getWidth()/2
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

return SceneTitle