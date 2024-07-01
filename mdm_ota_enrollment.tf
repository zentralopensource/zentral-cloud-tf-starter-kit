data "zentral_mdm_push_certificate" "zentral-cloud" {
  name = "Zentral Cloud"
}

data "zentral_mdm_scep_config" "zentral-mdm" {
  name = "Zentral MDM"
}

resource "zentral_mdm_ota_enrollment" "default" {
  name                  = "Default"
  display_name          = "Zentral MDM"
  blueprint_id          = zentral_mdm_blueprint.default.id
  push_certificate_id   = data.zentral_mdm_push_certificate.zentral-cloud.id
  scep_config_id        = data.zentral_mdm_scep_config.zentral-mdm.id
  meta_business_unit_id = zentral_meta_business_unit.default.id
}
