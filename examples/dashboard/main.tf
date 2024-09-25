locals {
  id = coalesce(var.pattern_id, split("-*", var.pattern)[0])
}

module "tenant" {
  source = "../../modules/dashboard/tenant"

  name = "test-tenant"
}

module "dashboard" {
  source = "../../modules/dashboard/index-pattern"

  tenant_name = "test-tenant"

  body = <<EOF
[
  {
    "_id": "index-pattern:${local.id}",
    "_type": "doc",
    "_source": {
      "type": "index-pattern",
      "index-pattern": {
        "title": "${var.pattern}",
        "timeFieldName": "${var.time_field_name}"
      }
    }
  }
]
EOF
}
