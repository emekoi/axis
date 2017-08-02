local _ = require "lib.lume"
local Object = require "obj.classic"
local Game = require "obj.game"
local Color = require "obj.color"

local TileMap = Object:extend()

function TileMap:new(name)
  self.solid = false
  self.data = require(name)
  self.map = sol.Buffer.fromBlank(self.data.width * self.data.tilewidth, self.data.height * self.data.tileheight)
end

function TileMap:update(dt)

end

function TileMap:render()
  for _, layer in ipairs(self.data.layers) do
    for _, obj in ipairs(layer.objects) do
      local color = obj.properties.static and Color["red"] or Color["blue"]

      if obj.shape == "rectangle" then
        self.map:drawBox(obj.x, obj.y, obj.width, obj.height, unpack(color))
      elseif obj.shape == "polygon" then
        self.map:drawPixel(obj.x, obj.y, unpack(color))

        local _p = {x = obj.x, y = obj.y}
        for _, p in ipairs(obj.polygon) do
          local x, y = obj.x + p.x, obj.y + p.y
          self.map:drawLine(_p.x, _p.y, x, y, unpack(color))
          _p = {x = x, y = y}
        end
        self.map:drawLine(_p.x, _p.y, obj.x, obj.y, unpack(color))

      end
    end
  end

  Game.framebuffer:draw(self.map, 0, 0)
  self.map:clear()
end


return TileMap
