local TowerConversation = require("src.towerConversation")
local TowerMedication = require("src.towerMedication")
local TowerPet = require("src.towerPet")

local Hotbar = {
    scene = nil,
    y = 10,
    scale = 1.25,
    towerScale = 0.47,
    towerImageXOffset = 8 * 1.25,
    towerImageYOffset = 8 * 1.25,
    towerImages = {}
}

function Hotbar:new()
    local hb = {}
    setmetatable(hb, self) 
    self.__index = self
    self.beginImg = love.graphics.newImage("assets/hotbar-begin.png")
    self.itemImg = love.graphics.newImage("assets/hotbar-item.png")
    self.selectedImg = love.graphics.newImage("assets/hotbar-selected.png")
    self.endImg = love.graphics.newImage("assets/hotbar-end.png")
    self.beginWidth = self.beginImg:getWidth() * self.scale
    self.itemWidth = self.itemImg:getWidth() * self.scale
    self.selectedWidth = self.selectedImg:getWidth() * self.scale
    self.endWidth = self.endImg:getWidth() * self.scale
    return hb
end

function Hotbar:setScene(scene)
    self.scene = scene
    self.width = self.beginWidth +
                 self.itemWidth * #scene.towers +
                 self.endWidth
    for i, type in ipairs(self.scene.towers) do
        self.towerImages[i] = love.graphics.newImage(type.imgPath)
    end
end

function Hotbar:draw()
    local currX = (love.graphics:getWidth() - self.width) / 2
    love.graphics.draw(self.beginImg, currX, self.y, 0, self.scale)
    currX = currX + self.beginWidth
    for i, type in ipairs(self.scene.towers) do
        if i == self.scene.player.selectedTower then
            love.graphics.draw(self.selectedImg, currX, self.y, 0, self.scale)
            love.graphics.draw(self.towerImages[i], currX + self.towerImageXOffset, self.y + self.towerImageYOffset, 0, self.towerScale)
            currX = currX + self.selectedWidth
        else
            love.graphics.draw(self.itemImg, currX, self.y, 0, self.scale)
            love.graphics.draw(self.towerImages[i], currX + self.towerImageXOffset, self.y + self.towerImageYOffset, 0, self.towerScale)
            currX = currX + self.itemWidth
        end
    end
    love.graphics.draw(self.endImg, currX, self.y, 0, self.scale)
end

return Hotbar