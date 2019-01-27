local Enemy = require("src.enemy")
local Utils = require("src.utils")

EnemyDoubt = Utils.inheritsFrom(Enemy)

function EnemyDoubt:new()
  local eb = self.create()
  Enemy.new(eb, "assets/images/doubt.png")
  return eb
end

return EnemyDoubt