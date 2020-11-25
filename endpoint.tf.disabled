resource "aws_security_group" "apigw-private" {
  name        = "apigw-private"
  description = "Allow ApiGW Traffic"
  vpc_id      = var.vpc_id
  
  ingress {
    description = "Any from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "apigw-private"
  }
}
resource "aws_vpc_endpoint" "apigw" {
  vpc_id       = var.vpc_id
  service_name = "com.amazonaws.us-west-2.execute-api"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  subnet_ids = var.subnets
  security_group_ids = [
    aws_security_group.apigw-private.id
  ]
}