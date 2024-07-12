resource "zentral_osquery_configuration" "default" {
  name               = "Default"
  inventory_apps     = true
  inventory_interval = 14400
  atc_ids            = [zentral_osquery_atc.munki-app-usage.id]
}

resource "zentral_osquery_enrollment" "default" {
  configuration_id      = zentral_osquery_configuration.default.id
  meta_business_unit_id = zentral_meta_business_unit.default.id
}

# ATCs

resource "zentral_osquery_atc" "munki-app-usage" {
  name        = "Munki Application Usage"
  description = "Table with bundle_id (and last version and last path to app) of applications as primary key paired with events (quit, launch, and activate, implying the end user summons it to take focus on screen as if they're actively interacting with it) and their last date and total counts for said events."
  path        = "/Library/Managed Installs/application_usage.sqlite"
  table_name  = "munki_app_usage"
  query = trimspace(<<EOQ
SELECT event,
       bundle_id,
       app_version,
       app_path,
       last_time,
       number_times
FROM application_usage;
EOQ
  )
  columns = [
    "event",
    "bundle_id",
    "app_version",
    "app_path",
    "last_time",
    "number_times"
  ]
  platforms = ["darwin"]
}
