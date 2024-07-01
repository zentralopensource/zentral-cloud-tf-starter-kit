resource "zentral_osquery_configuration" "default" {
  name               = "Default"
  inventory_apps     = true
  inventory_interval = 14400
}

resource "zentral_osquery_enrollment" "default" {
  configuration_id      = zentral_osquery_configuration.default.id
  meta_business_unit_id = zentral_meta_business_unit.default.id
}
