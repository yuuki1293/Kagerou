data "discord_permission" "admin" {
  administrator = "allow"
}

resource "discord_role" "admin" {
  name        = "管理用ロール"
  server_id   = discord_server.server.id
  permissions = data.discord_permission.admin.allow_bits
  position    = 0
}

locals {
  admin_members = [
    "933006368443604992"
  ]
}

resource "discord_member_roles" "admin" {
  for_each  = toset(local.admin_members)
  user_id   = each.value
  server_id = discord_server.server.id
  role {
    role_id = discord_role.admin.id
  }
}
