# Create security group for VPC endpoints
resource "aws_security_group" "vpce_security_group" {
  vpc_id      = module.lab_vpc.vpc_resources.vpc_id
  name        = "vpce-security-group"
  description = "Allow inbound HTTPS to VPC endpoints"

  tags = {
    Name = "vpce-sg"
  }
}

# Security group rule for HTTPS ingress
resource "aws_security_group_rule" "vpce_ingress" {
  type                     = "ingress"
  description              = "Allows HTTPS traffic"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.vpce_security_group.id
  source_security_group_id = aws_security_group.vpce_security_group.id
}

# Create VPC Endpoints
resource "aws_vpc_endpoint" "vpc_endpoints" {
  for_each             = toset(var.vpc_endpoints) # list of endpoint services to create
  vpc_id               = module.lab_vpc.vpc_resources.vpc_id
  subnet_ids           = module.lab_vpc.vpc_resources.private_subnet_ids
  service_name         = "com.amazonaws.${data.aws_region.current.id}.${each.key}"
  vpc_endpoint_type    = "Interface" # ssm and ssmmessages are Interface VPC Endpoints
  private_dns_enabled  = true
  security_group_ids   = [aws_security_group.vpce_security_group.id]

  tags = {
    Name = "vpce_${each.key}"
  }
}
