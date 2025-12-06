local lapis = require("lapis")
local redis = require("redis")
local db = require("lapis.db")

local app = lapis.Application()

app:get("/", function(self)
  local count = redis.incr("page_views") or 1
  local res = db.query("select * from my_table where id = ?", 10)

  return {
    json = {
      message = "Welcome",
      page_views = count,
      timestamp = os.date("%Y-%m-%d %H:%M:%S"),
    },
  }
end)
