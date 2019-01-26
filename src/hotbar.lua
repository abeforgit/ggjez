local TowerConversation = require("src.towerConversation")
local TowerMedication = require("src.towerMedication")
local TowerPet = require("src.towerPet")

Hotbar = {
    edgeWidth = 35,
    gapWidth = 20,

    towers = {
        TowerConversation,
        TowerMedication,
        TowerPet
    },

    barX = 0,
    barLength = 0,
    barY = 15,
    barHeight = 60
}

function Hotbar:new()
    local hb = {}
    setmetatable(hb, self) 
    self.__index = self
    self.barLength = self:calculateLength()
    self.barX = self:calculateX()
    return hb
end

function Hotbar:draw()
    love.graphics.rectangle("line", self.barX, self.barY, self.barLength, self.barHeight)
    for i, type in ipairs(self.towers) do
        local posX = self.barX + self.edgeWidth + (i - 1) * (self.barHeight + self.gapWidth)
        love.graphics.draw(self.towers[i]:new().img, posX, self.barY, 0, 0.465)
    end
end

function Hotbar:calculateLength()
    return 2*self.edgeWidth + (#self.towers)*self.barHeight + (#self.towers - 1)*self.gapWidth
end

function Hotbar:calculateX()
   screenMiddle = love.graphics.getWidth()/2
   return screenMiddle - self.barLength/2 
end

return Hotbar