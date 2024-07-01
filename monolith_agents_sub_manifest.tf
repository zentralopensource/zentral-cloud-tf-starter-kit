resource "zentral_monolith_sub_manifest" "agents" {
  name        = "Required agents"
  description = "The required agents for our standard macOS client"
}

# munki

resource "zentral_monolith_sub_manifest_pkg_info" "munkitools" {
  sub_manifest_id = zentral_monolith_sub_manifest.agents.id
  key             = "managed_installs"
  pkg_info_name   = "munkitools"
}

resource "zentral_monolith_sub_manifest_pkg_info" "munkitools-app-usage" {
  sub_manifest_id = zentral_monolith_sub_manifest.agents.id
  key             = "managed_installs"
  pkg_info_name   = "munkitools_app_usage"
}

# osquery

resource "zentral_monolith_sub_manifest_pkg_info" "osquery" {
  sub_manifest_id = zentral_monolith_sub_manifest.agents.id
  key             = "managed_installs"
  pkg_info_name   = "osquery"
}

# santa

resource "zentral_monolith_sub_manifest_pkg_info" "santa" {
  sub_manifest_id = zentral_monolith_sub_manifest.agents.id
  key             = "managed_installs"
  pkg_info_name   = "santa"
}
