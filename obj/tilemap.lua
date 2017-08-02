local _ = require "lib.lume"
local Object = require "obj.classic"
local Game = require "obj.game"
local Color = require "obj.color"
local Entity = require "obj.entity"

local TileMap = Object:extend()

function TileMap:new(name)
  self.solid = false
  self.data = require(name)
  self.map = sol.Buffer.fromBlank(self.data.width * self.data.tilewidth, self.data.height * self.data.tileheight)
  self.entities = {}
  for __, layer in ipairs(self.data.layers) do
    for __, obj in ipairs(layer.objects) do
      local e
      if obj.shape == "rectangle" then
        local points = {
          { x = 0,             y = 0 },
          { x = obj.width - 1, y = 0 },
          { x = obj.width - 1, y = obj.height - 1 },
          { x = 0,             y = obj.height - 1 },
        }
        e = Entity(obj.x, obj.y, points)
      elseif obj.shape == "polygon" then
        e = Entity(obj.x, obj.y, obj.polygon)
      end
      _.extend(e, obj.properties)
      _.push(self.entities, e)
    end
  end
end

function TileMap:update(dt)
  _.each(self.entities, "update", dt)
end

function TileMap:render()
  _.each(self.entities, "render", self.map)

  Game.framebuffer:draw(self.map, 0, 0)
  self.map:clear()
end


return TileMap
