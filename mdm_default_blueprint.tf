resource "zentral_mdm_blueprint" "default" {
  name                 = "Default"
  collect_apps         = "ALL"
  collect_certificates = "ALL"
  collect_profiles     = "ALL"
}

# Bootstrap package

resource "zentral_mdm_blueprint_artifact" "bootstrap-pkg" {
  blueprint_id = zentral_mdm_blueprint.default.id
  artifact_id  = zentral_mdm_artifact.bootstrap-pkg.id
  macos        = true
}

# All

resource "zentral_mdm_blueprint_artifact" "servicemanagement" {
  blueprint_id = zentral_mdm_blueprint.default.id
  artifact_id  = zentral_mdm_artifact.servicemanagement.id
  macos        = true
}

# Santa

resource "zentral_mdm_blueprint_artifact" "santa-tcc" {
  blueprint_id = zentral_mdm_blueprint.default.id
  artifact_id  = zentral_mdm_artifact.santa-tcc.id
  macos        = true
}

resource "zentral_mdm_blueprint_artifact" "santa-system-extension-policy" {
  blueprint_id = zentral_mdm_blueprint.default.id
  artifact_id  = zentral_mdm_artifact.santa-system-extension-policy.id
  macos        = true
}

resource "zentral_mdm_blueprint_artifact" "santa-notificationsettings" {
  blueprint_id = zentral_mdm_blueprint.default.id
  artifact_id  = zentral_mdm_artifact.santa-notificationsettings.id
  macos        = true
}

resource "zentral_mdm_blueprint_artifact" "santa-default-configuration" {
  blueprint_id = zentral_mdm_blueprint.default.id
  artifact_id  = zentral_mdm_artifact.santa-default-configuration.id
  macos        = true
}

# Monolith

resource "zentral_mdm_blueprint_artifact" "monolith-default-enrollment" {
  blueprint_id = zentral_mdm_blueprint.default.id
  artifact_id  = zentral_mdm_artifact.monolith-default-enrollment.id
  macos        = true
}

# Osquery

resource "zentral_mdm_blueprint_artifact" "osquery-tcc" {
  blueprint_id = zentral_mdm_blueprint.default.id
  artifact_id  = zentral_mdm_artifact.osquery-tcc.id
  macos        = true
}

resource "zentral_mdm_blueprint_artifact" "system-logging" {
  blueprint_id = zentral_mdm_blueprint.default.id
  artifact_id  = zentral_mdm_artifact.system-logging.id
  macos        = true
}
