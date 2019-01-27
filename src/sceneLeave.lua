local Scene = require("src.scene")
local Class = require("lib.hump.class")

local SceneLeave = Class{__includes = Scene}

SceneLeave.leaveButton = love.graphics.newImage("assets/images/leave.png")
SceneLeave.currentProgress = nil

function SceneLeave:init(main)
    Scene.init(self, main, "Leave")
    love.graphics.setBackgroundColor(95 / 255, 205 / 255, 228 / 255)
    self.leaveX = love.graphics.getWidth()/2 - self.leaveButton:getWidth()/2
    self.leaveY = love.graphics.getHeight()/2 - self.leaveButton:getHeight()/2 
end

function SceneLeave:draw()
    love.graphics.draw(self.leaveButton, self.leaveX, self.leaveY)
end

function SceneLeave:mousepressed()
    return function (x, y, button)
        if button == 1 then
            love.event.quit()
        end
    end
end

function SceneLeave:keypressed()
    return function (key, scancode, isrepeat)
        if key == "escape" then
            self:setScene(self.currentProgress)
        end
    end    
end

return SceneLeave
