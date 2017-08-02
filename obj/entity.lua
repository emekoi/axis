local Object = require "obj.classic"
local _ = require "lib.lume"
local Color = require "obj.color"

local Entity = Object:extend()

-- gravity done right
-- https://gamedev.stackexchange.com/questions/15708/how-can-i-implement-gravity
-- http://lolengine.net/blog/2011/12/14/understanding-motion-in-games

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
