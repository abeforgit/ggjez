TowerTypes = {
    TowerA,
    TowerB
}

Hotbar = {
    slot1 = nil,
    slot2 = nil,
    slot3 = nil
}

function Hotbar:new()
    local hb = {}
    setmetatable(hb, self) 
    self.__index = self
    return hb
end

function Hot

return Hotbar