resource "zentral_osquery_pack" "compliance-checks" {
  name        = "Compliance checks"
  description = "The compliance checks for our macOS client"
}

resource "zentral_osquery_query" "santa-sysext-cc" {
  name        = "Santa system extension check"
  description = "Check if the Santa system extension is activated, running and up-to-date"
  sql = trimspace(<<-EOT
  WITH expected_sysexts(team, identifier, min_version) AS (
    VALUES ('EQHXZ8M8AV', 'com.google.santa.daemon', '2024.5')
  ), found_sysexts AS (
    SELECT expected_sysexts.*, system_extensions.version, system_extensions.state,
    CASE
      WHEN system_extensions.version >= expected_sysexts.min_version
        AND system_extensions.state == 'activated_enabled'
      THEN 'OK'
      ELSE 'FAILED'
    END individual_ztl_status
    FROM expected_sysexts
    LEFT JOIN system_extensions ON (
      system_extensions.team = expected_sysexts.team
      AND system_extensions.identifier = expected_sysexts.identifier
    )
  ) SELECT team, identifier, version, state, MAX(individual_ztl_status) OVER () ztl_status
  FROM found_sysexts
  EOT
  )
  platforms                = ["darwin"]
  compliance_check_enabled = true
  scheduling = {
    pack_id             = zentral_osquery_pack.compliance-checks.id,
    interval            = var.osquery_default_compliance_check_interval,
    log_removed_actions = false,
    snapshot_mode       = true
  }
}
