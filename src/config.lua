local config = require("lapis.config")

config("development", {
  port = 8080,
  server = "nginx",
  code_cache = "off",
  num_workers = "1",
  redis = {
    password = "admin",
    host = "127.0.0.1",
    port = "6379",
  },
  postgres = {
    host = "127.0.0.1",
    password = "admin",
    user = "postgres",
    database = "valdai3ndfl",
  },
})

config("production", {
  port = 80,
  code_cache = "on",
  num_workers = 4,
})
