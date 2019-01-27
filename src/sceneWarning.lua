local SceneTitle = require("src.sceneTitle")

local SceneWarning = {
    warningImage = nil,
    width = nil,
    height = nil
}
function SceneWarning:loadSceneTitle()
    scn = SceneTitle:new()
    love.mousereleased = scn:mousereleased()
    love.keypressed = scn:keypressed()
    love.keyreleased = scn:keyreleased()
    love.mousepressed = scn:mousepressed()
    love.wheelmoved = scn:wheelmoved()
end

function SceneWarning:new() 
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


function SceneWarning:draw()
    love.graphics.draw(warningImage, love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 0, 1, 1, width / 2, height / 2)
end

function SceneWarning:update(dt)
    startTime = startTime + dt
    print(startTime)
    if startTime > 10 then
        self:loadSceneTitle()
    end
end

function SceneWarning:mousepressed()
    return function (x, y, button)
        self:loadSceneTitle()
    end
end


function SceneWarning:keypressed()
    return function (key, scancode, isrepeat)
        self:loadSceneTitle()
    end
end


function SceneWarning:mousereleased()
end

function SceneWarning:keyreleased()
end

function SceneWarning:wheelmoved(key)
end

return SceneWarning