Hotbar = {}

function Hotbar:new()
    local hb = {}
    setmetatable(hb, self) 
    self.__index = self
    return hb
end

return Hotbar