local TowerConversation = require("src.towerConversation")
local TowerMedication = require("src.towerMedication")
local TowerPet = require("src.towerPet")

local Hotbar = {
    edgeWidth = 35,
    gapWidth = 20,

    barX = 0,
    barLength = 0,
    barY = 15,
    barHeight = 60,

    scene = nil
}

function Hotbar:new()
    local hb = {}
    setmetatable(hb, self) 
    self.__index = self
    return hb
end

function Hotbar:draw()
    love.graphics.rectangle("line", self.barX, self.barY, self.barLength, self.barHeight)
    for i, type in ipairs(self.scene.towers) do
        local posX = self.barX + self.edgeWidth + (i - 1) * (self.barHeight + self.gapWidth)
        love.graphics.draw(self.scene.towers[i]:new().img, posX, self.barY, 0, 0.465)
    end
end

function Hotbar:setScene(scene)
    self.scene = scene
    self.barLength = 2*self.edgeWidth + (#self.scene.towers)*self.barHeight + (#self.scene.towers - 1)*self.gapWidth
    local screenMiddle = love.graphics.getWidth()/2
    self.barX = screenMiddle - self.barLength/2
end

return Hotbar