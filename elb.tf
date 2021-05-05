######
# ELB
######

# SSL certificate for HTTPS listener 
resource "aws_iam_server_certificate" "tf_test_cert" {
  name_prefix      = "tf_test_cert"
  certificate_body = file("app.sdenterprise.com-cert.pem")
  private_key      = file("app.sdenterprise.com-key.pem")

  lifecycle {
    create_before_destroy = true
  }
}

module "elb" {
  source          = "terraform-aws-modules/elb/aws"

  name            = "tf-test-elb"

  subnets         = [element(module.vpc.public_subnets, 0)]
  security_groups = [aws_security_group.sg_elb.id]
  internal        = false

  listener = [
    {
      instance_port     = "8800"
      instance_protocol = "HTTP"
      lb_port           = "443"
      lb_protocol       = "HTTPS"
      ssl_certificate_id = aws_iam_server_certificate.tf_test_cert.arn
    },
  ]

  health_check = {
    target              = "HTTP:8800/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  # ELB attachments -- server2
  number_of_instances = var.elb_number_of_instances
  instances           = module.ec2_instances.id

  tags = {
    Name  = "Test ELB"
    Owner = "Terraform"
  }
}
