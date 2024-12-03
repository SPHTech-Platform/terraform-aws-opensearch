locals {
  encryption_policy = {
    "Rules" = [
      {
        "Resource" = [
          "collection/${var.name}"
        ],
        "ResourceType" = "collection"
      }
    ],
    "AWSOwnedKey" = var.encryption_kms_arn == null ? true : false
    "KmsARN"      = var.encryption_kms_arn
  }

  network_policy = {
    AllowFromPublic = var.allow_public_access
    SourceVPCEs     = var.create_vpc_endpoint ? [aws_opensearchserverless_vpc_endpoint.this[0].id] : []
  }
}
