resource "zentral_santa_configuration" "default" {
  name           = "Default"
  client_mode    = "MONITOR"
  enable_bundles = true
}

resource "zentral_santa_enrollment" "default" {
  configuration_id      = zentral_santa_configuration.default.id
  meta_business_unit_id = zentral_meta_business_unit.default.id
}

resource "zentral_santa_rule" "default-north-pole-security" {
  configuration_id  = zentral_santa_configuration.default.id
  description       = "Allow North Pole Security as publisher."
  policy            = "ALLOWLIST"
  target_identifier = "ZMCG7MLDV9"
  target_type       = "TEAMID"
}

resource "zentral_santa_rule" "default-spctl-gatekeeper-block" {
  configuration_id  = zentral_santa_configuration.default.id
  custom_message    = "You cannot run spctl with these CLI arguments."
  description       = "Prevent users from disabling gatekeeper."
  policy            = "CEL"
  cel_expr          = "['--global-disable', '--master-disable','--disable', '--add', '--remove'].exists(flag, flag in args) ? BLOCKLIST : ALLOWLIST"
  target_identifier = "platform:com.apple.spctl"
  target_type       = "SIGNINGID"
}
