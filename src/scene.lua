Player = require("src.player")

Scene = {
    actors = {}
}

function Scene:new() 
    local scn = {}
    setmetatable(scn, self) 
    self.__index = self
    return scn
end

function Scene:addActor(actor)
    table.insert( self.actors, actor )
end


function Scene:draw()
    for _, actor in ipairs(self.actors) do
        actor:draw()
    end
end

function Scene:update(dt)
    for _, actor in ipairs(self.actors) do
        actor:update(dt)
    end
end

return Scene