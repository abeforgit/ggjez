local Tower = require("src.tower")
local Utils = require("src.utils")

TowerConversation = Utils.inheritsFrom(Tower)

TowerConversation.imgPath = "assets/conversation.png"

function TowerConversation:new()
  local tb = self.create()
  Tower.new(tb)
  return tb
end

return TowerConversation