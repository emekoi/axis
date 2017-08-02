G = {
  author = "emekoi",
  version = "0.1.0",
  license = "MIT",
  title = "axis",
  width = 128,
  height = 128,
  scale = 4,
  debug = false,
  verlet = "position",
}

if sol.system.info("os") == "windows" then
  io.stdout:setvbuf("no")
end

cls = sol.debug.clear

return {
  title = G.title,
  width = G.width * G.scale,
  height = G.height * G.scale,
}
