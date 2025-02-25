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
