local bump = require("lib.bump")
local Player = require("src.player")
local Enemy = require("src.enemy")
local Hotbar = require("src.hotbar")
local Glitches = require("src.glitches")
local Scene = require("src.scene")
local TitleScreen = require("src.titleScreen")


local WarningScreen = {
    warningImage = nil,
    width = nil,
    height = nil
}
function WarningScreen:loadTitleScreen()
    scn = TitleScreen:new()
    love.mousereleased = scn:mousereleased()
    love.keypressed = scn:keypressed()
    love.keyreleased = scn:keyreleased()
    love.mousepressed = scn:mousepressed()
    love.wheelmoved = scn:wheelmoved()
end

function WarningScreen:new() 
    local scn = {}
    setmetatable(scn, self) 
    self.__index = self
    love.window.setTitle("Warning")
    love.graphics.setBackgroundColor(95 / 255, 205 / 255, 228 / 255)
    startTime = 0

    warningImage = love.graphics.newImage("assets/epilepty_warning.jpg")
    width = warningImage:getWidth()
    height = warningImage:getHeight()
    return scn
end


function WarningScreen:draw()
    love.graphics.draw(warningImage, love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 0, 1, 1, width / 2, height / 2)
end

function WarningScreen:update(dt)
    startTime = startTime + dt
    print(startTime)
    if startTime > 10 then
        self:loadTitleScreen()
    end
end

function WarningScreen:mousepressed()
    return function (x, y, button)
        self:loadTitleScreen()
    end
end


function WarningScreen:keypressed()
    return function (key, scancode, isrepeat)
        self:loadTitleScreen()
    end
end


function WarningScreen:mousereleased()
end

function WarningScreen:keyreleased()
end

function WarningScreen:wheelmoved(key)
end

return WarningScreen