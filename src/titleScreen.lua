local bump = require("lib.bump")
local Player = require("src.player")
local Enemy = require("src.enemy")
local Hotbar = require("src.hotbar")
local Glitches = require("src.glitches")
local Scene = require("src.scene")


local TitleScreen = {
   playButton = nil,
   quitButton = nil,
   width = nil,
   height = nil,
   playButtonX = nil,
   playButtonY = nil,
   quitButtonX = nil,
   quitButtonY = nil
}

function startGame()
    scn = Scene:new()
    love.mousereleased = scn:mousereleased()
    love.keypressed = scn:keypressed()
    love.keyreleased = scn:keyreleased()
    love.mousepressed = scn:mousepressed()
end

function quitGame()
    love.event.quit()
end

function TitleScreen:new() 
    local scn = {}
    setmetatable(scn, self) 
    self.__index = self
    love.window.setTitle("Main menu")
    love.graphics.setBackgroundColor(95 / 255, 205 / 255, 228 / 255)
    playButton = love.graphics.newImage("assets/play.png")
    quitButton = love.graphics.newImage("assets/death.png")
    width = playButton:getWidth()
    height = playButton:getHeight()
    return scn
end

function TitleScreen:addActor(actor, x, y)
    actor.x = x or 0
    actor.y = y or 0
    table.insert(self.actors, actor)
    actor:setScene(self)
end
function TitleScreen:removeActor(actor)
    local ind = nil
    for i, v in ipairs(self.actors) do
        if v == actor then
            ind = i
            break
        end
    end
    table.remove( self.actors, ind)
    self.world:remove(actor)
end


function TitleScreen:draw()
    playButtonX = love.graphics.getWidth() / 2
    playButtonY = love.graphics.getHeight() / 2
    quitButtonX = love.graphics.getWidth() / 2 
    quitButtonY = love.graphics.getHeight() / 2 + 200
    love.graphics.draw(playButton, playButtonX , playButtonY, 0, 1, 1, width / 2, height / 2)
    love.graphics.draw(quitButton, quitButtonX, quitButtonY, 0, 1, 1, quitButton:getWidth() / 2, quitButton:getHeight() / 2)
end

function TitleScreen:update(dt)
    
end

function TitleScreen:mousereleased()
    -- return self.player:mousereleased()
end

function TitleScreen:mousepressed()
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

    -- return self.player:mousepressed()
end

function calculateDist(x, y, imgX, imgY)
    local diffX = x - imgX
    local diffY = y - imgY
    return math.sqrt(diffX * diffX + diffY * diffY)
end

function TitleScreen:keypressed()
    -- return self.player:keypressed()
end

function TitleScreen:keyreleased()
    -- return self.player:keyreleased()
end

return TitleScreen