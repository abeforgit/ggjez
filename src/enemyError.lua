Enemy = require("src.enemy")
Utils = require("src.utils")

EnemyError = Utils.inheritsFrom(Enemy)

function EnemyError:new()
  local ee = self.create()
  Enemy.new(ee, "assets/err.png")
  ee.speed = 200
  return ee
end

return EnemyError