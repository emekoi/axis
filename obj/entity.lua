-- gravity done right
--https://www.gamedev.net/articles/programming/math-and-physics/a-verlet-based-approach-for-2d-game-physics-r2714/
-- https://gamedev.stackexchange.com/questions/15708/how-can-i-implement-gravity
-- http://lolengine.net/blog/2011/12/14/understanding-motion-in-games

local Object = require "obj.classic"
local _ = require "lib.lume"
local Color = require "obj.color"

local Entity = Object:extend()
local Edge = Object:extend()



if G.verlet == "velocity" then

  function Entity:new(x, y, points)
    self.x, self.vx = x or 0, 0
    self.y, self.vy = y or 0, 0
    self.points = points
    self.accel = { x = 0, y = 9.8^2 }
  end


  function Entity:update(dt)
    if not self.static then
      local pvx, pvy = self.vx, self.vy
      self.vx = self.vx + self.accel.x * dt
      self.vy = self.vy + self.accel.y * dt
      self.x = self.x + (pvx + self.vx) * 0.5 * dt
      self.y = self.y + (pvy + self.vy) * 0.5 * dt
    end
    if self.solid then
    end
  end

else

  function Entity:new(x, y, points)
    self.x, self.px = x or 0, x or 0
    self.y, self.py = y or 0, y or 0
    self.points = points
    self.accel = { x = 0, y = 1000 }
  end


  function Entity:update(dt)
    if not self.static then
      self.x = self.x + (self.x - self.px) + self.accel.x * dt ^ 2
      self.y = self.y + (self.y - self.py) + self.accel.y * dt ^ 2

      self.px, self.py = self.x, self.y
    end
    if self.solid then
    end
  end

end


function Entity:render(map)
  local color = self.static and Color["red"] or Color["blue"]
  map:drawPixel(self.x, self.y, unpack(color))
  local _p = {x = self.x, y = self.y}
  for _, p in ipairs(self.points) do
    local x, y = self.x + p.x, self.y + p.y
    if self.dd then print(x, y) end
    map:drawLine(_p.x, _p.y, x, y, unpack(color))
    _p = {x = x, y = y}
  end
  map:drawLine(_p.x, _p.y, self.x, self.y, unpack(color))
end


return Entity
