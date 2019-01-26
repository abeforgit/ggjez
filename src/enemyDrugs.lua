local Enemy = require("src.enemy")
local Utils = require("src.utils")

EnemyDrugs = Utils.inheritsFrom(Enemy)

function EnemyDrugs:new()
  local eb = self.create()
  Enemy.new(eb, "assets/syringe.png")
  return eb
end

return EnemyDrugs