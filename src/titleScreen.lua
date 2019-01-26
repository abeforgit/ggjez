local bump = require("lib.bump")
local Player = require("src.player")
local Enemy = require("src.enemy")
local Hotbar = require("src.hotbar")
local Glitches = require("src.glitches")
local Scene = require("src.scene")


local TitleScreen = {
   playButton = nil,
   width = nil,
   height = nil
}

function startGame()
    scn = Scene:new()
    love.mousereleased = scn:mousereleased()
    love.keypressed = scn:keypressed()
    love.keyreleased = scn:keyreleased()
    love.mousepressed = scn:mousepressed()
end

function quitGame()
    return nil
end

function TitleScreen:new() 
    local scn = {}
    setmetatable(scn, self) 
    self.__index = self
    love.window.setTitle("Main menu")
    love.graphics.setBackgroundColor(95 / 255, 205 / 255, 228 / 255)
    playButton = love.graphics.newImage("assets/play.png")
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
   love.graphics.draw(playButton, love.graphics.getWidth() /2 , love.graphics.getHeight() / 2 , 0, 1, 1, width / 2, height / 2)
end

function TitleScreen:update(dt)
    
end

function TitleScreen:mousereleased()
    -- return self.player:mousereleased()
end

function TitleScreen:mousepressed()
    return function (x, y, button)
        if button == 1 then
            local imgX = love.graphics.getWidth() /2 
            local imgY = love.graphics.getHeight() / 2
            local r = playButton:getWidth()/2
            local diffX = x - imgX
            local diffY = y - imgY
            local dist = math.sqrt( diffX * diffX + diffY * diffY)
            if dist < r then
                startGame()
            end
        end
    end

    -- return self.player:mousepressed()
end

function TitleScreen:keypressed()
    -- return self.player:keypressed()
end

function TitleScreen:keyreleased()
    -- return self.player:keyreleased()
end

return TitleScreen