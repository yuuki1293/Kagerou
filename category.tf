resource "discord_category_channel" "general" {
  name      = "general"
  server_id = discord_server.server.id
  position  = 0
}

resource "discord_category_channel" "announce" {
  name      = "announcement"
  server_id = discord_server.server.id
  position  = 1
}