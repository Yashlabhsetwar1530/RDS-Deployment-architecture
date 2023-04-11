# Create security group for ELB
resource "aws_security_group" "elb_sg" {
  name_prefix = "elb_sg_"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
