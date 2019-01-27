local Tower = require("src.tower")
local Utils = require("src.utils")
local EnemyDoubts = require("src.enemyDoubt")

TowerConversation = Utils.inheritsFrom(Tower)

TowerConversation.imgPath = "assets/conversation.png"
TowerConversation.evilSide = EnemyDoubts

function TowerConversation:new()
  local tb = self.create()
  Tower.new(tb)
  return tb
end

return TowerConversation