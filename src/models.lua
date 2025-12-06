local lapis = require("lapis")
local Model = require("lapis.db.model").Model

local app = lapis.Application()

local MyTable = Model:extend("requests")

app:match("/", function()
  local row = MyTable:find(10)
  return "ok!"
end)

return app
