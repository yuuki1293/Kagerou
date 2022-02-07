resource "discord_role_everyone" "everyone" {
  server_id   = local.server_id
  permissions = 0
}

resource "discord_channel_permission" "newcomer" {
  channel_id   = discord_text_channel.newcomer.id
  type         = "role"
  overwrite_id = discord_role_everyone.everyone.id
  allow        = data.discord_permission.read_only.allow_bits
  deny         = data.discord_permission.read_only.deny_bits
}

resource "discord_channel_permission" "newcomer_member" {
  channel_id   = discord_text_channel.newcomer.id
  type         = "role"
  overwrite_id = discord_role.member.id
  allow        = 0
  deny         = data.discord_permission.not_accessible.deny_bits
}

resource "discord_channel_permission" "announce" {
  channel_id   = discord_category_channel.announce.id
  type         = "role"
  overwrite_id = discord_role.member.id
  deny         = data.discord_permission.read_only.deny_bits
}

resource "discord_channel_permission" "read_only" {
  channel_id   = discord_category_channel.read_only.id
  type         = "role"
  overwrite_id = discord_role.member.id
  allow        = 0
  deny         = data.discord_permission.read_only.deny_bits
}

resource "discord_channel_permission" "stock_r18_member" {
  channel_id   = discord_text_channel.stock_r18.id
  type         = "role"
  overwrite_id = discord_role.member.id
  allow        = 0
  deny         = data.discord_permission.not_accessible.deny_bits
}

resource "discord_channel_permission" "stock_r18_safe_guard" {
  channel_id   = discord_text_channel.stock_r18.id
  type         = "role"
  overwrite_id = discord_role.safe_guard_nsfw.id
  allow        = data.discord_permission.read_only.allow_bits
  deny         = data.discord_permission.read_only.deny_bits
}

resource "discord_channel_permission" "thumbs_down_member" {
  channel_id   = discord_text_channel.thumbs_down.id
  type         = "role"
  overwrite_id = discord_role.member.id
  allow        = 0
  deny         = data.discord_permission.not_accessible.deny_bits
}

resource "discord_channel_permission" "thumbs_down_safe_guard" {
  channel_id   = discord_text_channel.thumbs_down.id
  type         = "role"
  overwrite_id = discord_role.safe_guard.id
  allow        = data.discord_permission.read_only.allow_bits
  deny         = data.discord_permission.read_only.deny_bits
}

resource "discord_channel_permission" "management" {
  channel_id   = discord_category_channel.management.id
  type         = "role"
  overwrite_id = discord_role_everyone.everyone.id
  allow        = 0
  deny         = data.discord_permission.not_accessible.deny_bits
}

# suspiciousはすべてのチャンネルでread-only
resource "discord_channel_permission" "suspicious" {
  channel_id   = discord_category_channel.general.id
  type         = "role"
  overwrite_id = discord_role.member.id
  deny         = data.discord_permission.read_only.deny_bits
}