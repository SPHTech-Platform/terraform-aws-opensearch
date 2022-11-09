locals {
  log_publishing_options_default = {
    audit_logs = {
      enabled = true
    }
    index_slow_logs = {
      enabled = true
    }
  }
}
