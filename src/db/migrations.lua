local db = require("lapis.db")
local schema = require("lapis.db.schema")
local types = schema.types

return {
  [1765024256] = function()
    schema.create_table("users", {
      { "id", types.serial },
      { "username", types.varchar },
      { "email", types.varchar },
      { "created_at", types.time },
      { "updated_at", types.time },
      "PRIMARY KEY (id)",
    })
  end,
}
