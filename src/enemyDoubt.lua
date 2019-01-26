Enemy = require("src.enemy")
Utils = require("src.utils")

EnemyDoubt = Utils.inheritsFrom(Enemy)

function EnemyDoubt:new()
  local eb = self.create()
  Enemy.new(eb, "assets/doubt.png")
  return eb
end

return EnemyDoubt