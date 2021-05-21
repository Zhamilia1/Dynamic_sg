# Dynamic configuration for security group

resource "aws_security_group" "main_sg" {
  name   = "main_sg"
  description = this is sg module
}

  dynamic "ingress" {
    for_each = var.ports_for_ingress
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] 
    }
  }

  dynamic "egress" {
    for_each = var.ports_for_egress
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
#Variables for 
  variable "ports_for_ingress" {
  type        = list(number)
  description = "these are inbound rule ports"
  default     = [22, 80]
}

variable "ports_for_egress" {
  type        = list(number)
  description = "these are outbound rule ports"
  default     = [25, 8080]
}