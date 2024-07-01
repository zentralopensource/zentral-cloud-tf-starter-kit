resource "zentral_munki_configuration" "default" {
  name = "Default"
}

resource "zentral_munki_enrollment" "default" {
  configuration_id      = zentral_munki_configuration.default.id
  meta_business_unit_id = zentral_meta_business_unit.default.id
}
