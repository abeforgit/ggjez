local SceneTitle = require("src.sceneTitle")
local Scene = require("src.scene")
local Class = require("lib.hump.class")

local SceneWarning = Class{__includes = Scene}

function SceneWarning:init(main)
    Scene.init(self, main, "Warning")
    self.startTime = 0
    self.warningFont = love.graphics.newFont(100)
    self.warningColor = {1,0,0,1}
    self.textFont = love.graphics.newFont(50)
    self.textColor = {1,1,1,1}
    self.continueFont = love.graphics.newFont(25)
    self.continueColor = {1,1,1,1}
end


function SceneWarning:draw()
    r,g,b,a = love.graphics.getColor()
    font = love.graphics.getFont()

    love.graphics.setFont(self.warningFont)
    love.graphics.setColor(self.warningColor)
    love.graphics.printf("WARNING", 0, 200, love.graphics.getWidth(), "center")

    love.graphics.setFont(self.textFont)
    love.graphics.setColor(self.textColor)
    love.graphics.printf("The following contains bright, flashing lights and/or imagery that may cause discomfort and/or seizures for those with photosensitive epilepsy. Viewer discretion is advised.", love.graphics.getWidth() / 4, 400, love.graphics.getWidth() / 2, "center")

    love.graphics.setFont(self.continueFont)
    love.graphics.setColor(self.continueColor)
    love.graphics.print("Press any key to continue....", 0, love.graphics.getHeight() - self.continueFont:getHeight())

    love.graphics.setFont(font)
    love.graphics.setColor(r,g,b,a)
end

function SceneWarning:update(dt)
    self.startTime = self.startTime + dt
    print(self.startTime)
    if self.startTime > 10 then
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