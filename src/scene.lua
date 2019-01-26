local bump = require("lib.bump")
local Player = require("src.player")
local Enemy = require("src.enemy")
local Hotbar = require("src.hotbar")
local Glitches = require("src.glitches")

local Scene = {
    actors = {},
    world = nil,
    player = nil,
    hotbar = nil
}

function Scene:new() 
    local scn = {}
    setmetatable(scn, self) 
    self.__index = self
    self.world = bump.newWorld()
    self.player = Player:new()
    scn:addActor(self.player)
    love.graphics.setBackgroundColor(95 / 255, 205 / 255, 228 / 255)
    return scn
end

function Scene:addActor(actor, x, y)
    actor.x = x or 0
    actor.y = y or 0
    table.insert(self.actors, actor)
    actor:setScene(self)
end
function Scene:removeActor(actor)
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


function Scene:draw()
    local severity = 0
    Glitches.screenShake(severity)
    for _, actor in ipairs(self.actors) do
        actor:draw()
    end
    Glitches.glitchOverlay(severity)
end

function Scene:update(dt)
    for _, actor in ipairs(self.actors) do
        actor:update(dt)
    end
end

function Scene:mousereleased()
    self.player:mousepressed()
    self.player:mousereleased()
    self.player:keypressed()
    self.player:keyreleased()
end

function Scene:mousepressed()
end

function Scene:keypressed()
end

function Scene:keyreleased()
end

return Scene