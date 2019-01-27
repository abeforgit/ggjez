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
local Spawner = require("src.spawner")
local Class = require("lib.hump.class")
local SceneLeave = require("src.sceneLeave")
local Scene = require("src.scene")
local Wall = require("src.wall")


local SceneGame = Class{__includes = Scene}

SceneGame.actors = {}
SceneGame.world = nil
SceneGame.player = nil
SceneGame.hotbar = nil
SceneGame.healthbar = nil
SceneGame.cursorSwitched = false
SceneGame.spawnerAmount = 10
SceneGame.spawners = {}
SceneGame.maxEntities = 250

SceneGame.towers = {
    TowerConversation,
    TowerMedication,
    TowerPet
}

SceneGame.enemies = {
    EnemyDeath,
    EnemyDoubt,
    EnemyDrugs
}

function SceneGame:init(main)
    Scene.init(self, main, "Bastion of sanity")
    self.world = bump.newWorld()

    self:initBackground()

    self:addActor(Wall(1, love.graphics.getHeight()), 0, 0)
    self:addActor(Wall(1, love.graphics.getHeight()), love.graphics.getWidth(), 0)
    self:addActor(Wall(love.graphics.getWidth(), 1), 0, 0)
    self:addActor(Wall(love.graphics.getWidth(), 1), 0, love.graphics.getHeight())

    self.player = Player()
    self:addActor(self.player, love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)

    self.hotbar = Hotbar()
    self.hotbar:setScene(self)

    self.healthbar = Healthbar()
    self.healthbar:setScene(self)

    for i = 1, self.spawnerAmount do
        local spwn = Spawner()
        spwn:setScene(self)
        table.insert(self.spawners, spwn)
    end

    love.mouse.setCursor(love.mouse.newCursor("assets/images/cursor-good.png"))
end

function SceneGame:initBackground()
    local bedRight = Static("assets/images/bed-right.png", true)
    self:addActor(bedRight, love.graphics.getWidth() * (7/8) - bedRight.w, love.graphics.getHeight() * (1/8))
    self:addActor(Static("assets/images/bed-left.png", true), love.graphics.getWidth() * (7/8) - (bedRight.w) * 2, love.graphics.getHeight() * (1/8))

    self:addActor(Static("assets/images/table.png", true), love.graphics.getWidth() * (7/8) - bedRight.w / 2, love.graphics.getHeight() * (1/8) + bedRight.h)

    self:addActor(Static("assets/images/carpet.png", false), love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
    self:addActor(Static("assets/images/carpet.png", false), love.graphics.getWidth() / 2 - 256, love.graphics.getHeight() / 2)
    
    self:addActor(Static("assets/images/sofa-left.png", true, 3*math.pi/2), love.graphics.getWidth() * (6/7) - 128, love.graphics.getHeight() - 192)
    self:addActor(Static("assets/images/sofa-right.png", true, 3*math.pi/2), love.graphics.getWidth() * (6/7) - 128, love.graphics.getHeight() - 320)

    self:addActor(Static("assets/images/toilet.png", true, math.pi), love.graphics.getWidth() * (2/7) - 128, love.graphics.getHeight() - 128)

    self:addActor(Static("assets/images/closet.png", true, math.pi / 2), love.graphics.getWidth() * (2/7), 0)

    self:addActor(Static("assets/images/desk.png", true, math.pi * 3 / 2), 256, love.graphics.getHeight() / 2)
end

function SceneGame:addActor(actor, x, y)
    if #self.actors > self.maxEntities then return end
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
    self.world:remove(actor.vision)
    self.world:remove(actor)
end

function SceneGame:draw()
    local severity = 100 - self.player.health

    if (not (self.cursorSwitched) and severity >= 100) then
        self:stopSong()
        self:playSong(true)
        love.mouse.setCursor(love.mouse.newCursor("assets/images/cursor-bad.png"))
        self.cursorSwitched = true
    elseif (self.cursorSwitched and severity < 100) then
        self:stopSong()
        self:playSong(false)
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

    for _, spawner in ipairs(self.spawners) do
        spawner:update(dt)
    end
end

function SceneGame:mousereleased()
    return self.player:mousereleased()
end

function SceneGame:mousepressed()
    return self.player:mousepressed()
end

function SceneGame:keypressed()
    return function (key, scancode, isrepeat)
        if key == "escape" then 
            local menu = SceneLeave(self.main)
            menu.currentProgress = self
            self:setScene(menu)
        else 
            self.player:keypressed()(key, scancode, isrepeat)
        end 
    end
end

function SceneGame:keyreleased()
    return self.player:keyreleased()
end

function SceneGame:wheelmoved()
    return self.player:wheelmoved()
end

return SceneGame