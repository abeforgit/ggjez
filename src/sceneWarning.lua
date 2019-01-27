local SceneTitle = require("src.sceneTitle")
local Scene = require("src.scene")
local Class = require("lib.hump.class")

local SceneWarning = Class{__includes = Scene}
SceneWarning.warningImage = nil
SceneWarning.width = nil
SceneWarning.height = nil

function SceneWarning:init(main)
    print(main)
    Scene.init(self, main, "Warning")
    love.graphics.setBackgroundColor(95 / 255, 205 / 255, 228 / 255)
    startTime = 0

    warningImage = love.graphics.newImage("assets/epilepty_warning.jpg")
    width = warningImage:getWidth()
    height = warningImage:getHeight()
end


function SceneWarning:draw()
    love.graphics.draw(warningImage, love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 0, 1, 1, width / 2, height / 2)
end

function SceneWarning:update(dt)
    startTime = startTime + dt
    print(startTime)
    if startTime > 10 then
        self:setScene(SceneTitle(self.main))
    end
end

function SceneWarning:mousepressed()
    return function (x, y, button)
        self:setScene(SceneTitle(self.main))
    end
end


function SceneWarning:keypressed()
    return function (key, scancode, isrepeat)
        self:setScene(SceneTitle())
    end
end

return SceneWarning