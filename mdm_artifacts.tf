# Monolith

resource "zentral_mdm_artifact" "monolith-default-enrollment" {
  name      = "Monolith - Default enrollment"
  type      = "Profile"
  channel   = "Device"
  platforms = ["macOS"]
}

resource "zentral_mdm_profile" "monolith-default-enrollment-1" {
  artifact_id = zentral_mdm_artifact.monolith-default-enrollment.id
  source = base64encode(
    templatefile(
      "${path.module}/mobileconfigs/monolith.default-enrollment.v1.mobileconfig",
      {
        fqdn   = var.fqdn,
        secret = zentral_monolith_enrollment.default.secret
      }
    )
  )
  macos   = true
  version = 1
}

# Bootstrap package

resource "zentral_mdm_artifact" "bootstrap-pkg" {
  name                           = "Monolith - Bootstrap package"
  type                           = "Enterprise App"
  channel                        = "Device"
  platforms                      = ["macOS"]
  auto_update                    = false
  install_during_setup_assistant = true
  requires                       = [zentral_mdm_artifact.monolith-default-enrollment.id]
}

resource "zentral_mdm_enterprise_app" "bootstrap-pkg-2024-001" {
  artifact_id    = zentral_mdm_artifact.bootstrap-pkg.id
  package_uri    = "s3://zentral-pro-services-artifacts-eu-central-1/saas-public/bootstrap-2024.007.pkg"
  package_sha256 = "18b128e6e900ed42624ea9f574f7af8f3df8c6c8d0263981d6fee639c95b73f4"
  macos          = true
  version        = 1
}

# All

resource "zentral_mdm_artifact" "servicemanagement" {
  name      = "All - Managed Login Items settings"
  type      = "Profile"
  channel   = "Device"
  platforms = ["macOS"]
}

resource "zentral_mdm_profile" "servicemanagement-1" {
  artifact_id = zentral_mdm_artifact.servicemanagement.id
  source      = filebase64("${path.module}/mobileconfigs/all.servicemanagement.v1.mobileconfig")
  macos       = true
  version     = 2
}

# Google Santa

resource "zentral_mdm_artifact" "santa-tcc" {
  name      = "Santa - TCC"
  type      = "Profile"
  channel   = "Device"
  platforms = ["macOS"]
}

resource "zentral_mdm_profile" "santa-tcc-1" {
  artifact_id = zentral_mdm_artifact.santa-tcc.id
  source      = filebase64("${path.module}/mobileconfigs/santa.tcc.v1.mobileconfig")
  macos       = true
  version     = 1
}

resource "zentral_mdm_artifact" "santa-system-extension-policy" {
  name      = "Santa - System Extension policy"
  type      = "Profile"
  channel   = "Device"
  platforms = ["macOS"]
}

resource "zentral_mdm_profile" "santa-system-extension-policy-1" {
  artifact_id = zentral_mdm_artifact.santa-system-extension-policy.id
  source      = filebase64("${path.module}/mobileconfigs/santa.system-extension-policy.v1.mobileconfig")
  macos       = true
  version     = 1
}

resource "zentral_mdm_artifact" "santa-notificationsettings" {
  name      = "Santa - Notification settings"
  type      = "Profile"
  channel   = "Device"
  platforms = ["macOS"]
}

resource "zentral_mdm_profile" "santa-notificationsettings-1" {
  artifact_id = zentral_mdm_artifact.santa-notificationsettings.id
  source      = filebase64("${path.module}/mobileconfigs/santa.notificationsettings.v1.mobileconfig")
  macos       = true
  version     = 1
}

resource "zentral_mdm_artifact" "santa-default-configuration" {
  name      = "Santa - Default configuration"
  type      = "Profile"
  channel   = "Device"
  platforms = ["macOS"]
}

resource "zentral_mdm_profile" "santa-default-configuration-1" {
  artifact_id = zentral_mdm_artifact.santa-default-configuration.id
  source = base64encode(
    templatefile(
      "${path.module}/mobileconfigs/santa.default-configuration.v1.mobileconfig",
      {
        fqdn   = var.fqdn,
        secret = zentral_santa_enrollment.default.secret
      }
    )
  )
  macos   = true
  version = 1
}

# Osquery

resource "zentral_mdm_artifact" "osquery-tcc" {
  name      = "Osquery - TCC"
  type      = "Profile"
  channel   = "Device"
  platforms = ["macOS"]
}

resource "zentral_mdm_profile" "osquery-tcc-1" {
  artifact_id = zentral_mdm_artifact.osquery-tcc.id
  source      = filebase64("${path.module}/mobileconfigs/osquery.tcc.v1.mobileconfig")
  macos       = true
  version     = 1
}

resource "zentral_mdm_artifact" "system-logging" {
  name      = "system logging - enable private data"
  type      = "Profile"
  channel   = "Device"
  platforms = ["macOS"]
}

resource "zentral_mdm_profile" "system-logging-1" {
  artifact_id = zentral_mdm_artifact.system-logging.id
  source      = filebase64("${path.module}/mobileconfigs/system.logging.v1.mobileconfig")
  macos       = true
  version     = 1
}
