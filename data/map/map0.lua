return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.0.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 16,
  tilewidth = 8,
  tileheight = 8,
  nextobjectid = 20,
  properties = {},
  tilesets = {},
  layers = {
    {
      type = "objectgroup",
      name = "layer0",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 2,
          name = "ground",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 96,
          width = 128,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["static"] = true
          }
        },
        {
          id = 7,
          name = "ramp0",
          type = "",
          shape = "polygon",
          x = 88,
          y = 96,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 39.9109, y = -15.9644 },
            { x = 39.9109, y = 0 }
          },
          properties = {
            ["solid"] = true,
            ["static"] = true
          }
        },
        {
          id = 9,
          name = "box0",
          type = "",
          shape = "rectangle",
          x = 8,
          y = 8,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["static"] = false
          }
        },
        {
          id = 11,
          name = "box0",
          type = "",
          shape = "rectangle",
          x = 104,
          y = 8,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["static"] = false
          }
        },
        {
          id = 17,
          name = "poly1",
          type = "",
          shape = "polygon",
          x = 40,
          y = 24,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 47.8931, y = 0 },
            { x = 23.9465, y = -15.9644 }
          },
          properties = {
            ["solid"] = true,
            ["static"] = false
          }
        },
        {
          id = 18,
          name = "poly2",
          type = "",
          shape = "polygon",
          x = 40,
          y = 32,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 31.9287, y = 15.9644 },
            { x = 48, y = 32 },
            { x = -16, y = 32 },
            { x = -24, y = 0 }
          },
          properties = {
            ["solid"] = false,
            ["static"] = true
          }
        },
        {
          id = 19,
          name = "ramp1",
          type = "",
          shape = "polygon",
          x = 32,
          y = 96,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -32, y = -16 },
            { x = -32, y = 0 }
          },
          properties = {
            ["solid"] = true,
            ["static"] = true
          }
        }
      }
    }
  }
}
