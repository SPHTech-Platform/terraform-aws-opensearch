resource "aws_opensearchserverless_vpc_endpoint" "this" {
  count = var.create_vpc_endpoint ? 1 : 0

  name               = "${var.name}-vpce"
  vpc_id             = var.vpc_id
  subnet_ids         = var.subnet_ids
  security_group_ids = var.security_group_ids
}
