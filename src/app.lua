local lapis = require("lapis")
local db = require("lapis.db")

local app = lapis.Application()

app:get("/", function(self)
  local res = db.query("select * from my_table where id = ?", 10)

  return {
    json = {
      message = "Welcome",
      timestamp = os.date("%Y-%m-%d %H:%M:%S"),
    },
  }
end)
