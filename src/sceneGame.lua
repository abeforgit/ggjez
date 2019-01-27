local bump = require("lib.bump")
local Player = require("src.player")
local EnemyDoubt = require("src.enemyDoubt")
local EnemyDrugs = require("src.enemyDrugs")
local EnemyDeath = require("src.enemyDeath")
local TowerConversation = require("src.towerConversation")
local TowerMedication = require("src.towerMedication")
local TowerPet = require("src.towerPet")
local Hotbar = require("src.hotbar")
local Healthbar = require("src.healthbar")
local Glitches = require("src.glitches")
local Static = require("src.static")

local SceneGame = {
    actors = {},
    world = nil,
    player = nil,
    hotbar = nil,
    healthbar = nil,
    cursorSwitched = false,

    towers = {
        TowerConversation,
        TowerMedication,
        TowerPet
    }
}

function SceneGame:new() 
    local scn = {}
    setmetatable(scn, self) 
    self.__index = self
    self.world = bump.newWorld()

    local test = EnemyDeath()
    print(test.vision)
    scn:addActor(test)

    scn:addActor(Static("assets/images/carpet.png", false), 200, 100)
    scn:addActor(Static("assets/images/bed-left.png", true), 500, 100)
    scn:addActor(Static("assets/images/bed-right.png", true), 628, 100)
    scn:addActor(Static("assets/images/sofa-left.png", true), 500, 500)
    scn:addActor(Static("assets/images/sofa-right.png", true), 628, 500)
    scn:addActor(EnemyDeath(), 628, 100)
    scn:addActor(TowerConversation(), 500, 300)

    self.player = Player()
    scn:addActor(self.player)

    self.hotbar = Hotbar()
    self.hotbar:setScene(scn)

    self.healthbar = Healthbar()
    self.healthbar:setScene(scn)

    love.mouse.setCursor(love.mouse.newCursor("assets/images/cursor-good.png"))
    
    return scn
end

function SceneGame:addActor(actor, x, y)
    actor.x = x or 0
    actor.y = y or 0
    table.insert(self.actors, actor)
    actor:setScene(self)
end

function SceneGame:removeActor(actor)
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

function SceneGame:draw()
    local severity = 100 - self.player.health

    if ( not (self.cursorSwitched) and severity >= 100) then
        love.mouse.setCursor(love.mouse.newCursor("assets/images/cursor-bad.png"))
        self.cursorSwitched = true
    elseif (self.cursorSwitched and severity < 100) then
        love.mouse.setCursor(love.mouse.newCursor("assets/images/cursor-good.png"))
        self.cursorSwitched = false
    end
    Glitches:draw(severity)
    for _, actor in ipairs(self.actors) do
        actor:draw()
    end

    self.hotbar:draw()
    self.healthbar:draw()
end

function SceneGame:update(dt)
    for _, actor in ipairs(self.actors) do
        actor:update(dt)
    end
end

function SceneGame:mousereleased()
    return self.player:mousereleased()
end

function SceneGame:mousepressed()
    return self.player:mousepressed()
end

function SceneGame:keypressed()
    return self.player:keypressed()
end

function SceneGame:keyreleased()
    return self.player:keyreleased()
end

function SceneGame:wheelmoved()
    return self.player:wheelmoved()
end

return SceneGame