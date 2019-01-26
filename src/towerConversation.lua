local Tower = require("src.tower")
local Utils = require("src.utils")

TowerConversation = Utils.inheritsFrom(Tower)

function TowerConversation:new()
  local tb = self.create()
  Tower.new(tb, "assets/conversation.png")
  return tb
end

return TowerConversation