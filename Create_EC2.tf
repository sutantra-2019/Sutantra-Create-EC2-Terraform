provider "aws" {
  region                  = "us-west-2"
  shared_credentials_file = "/root/.aws/credentials"
  profile                 = "default"
  version                 = "2.58"
}

resource "aws_instance" "PGE-ECM-EC2" {
  ami                    = "ami-0a243dbef00e96192"
  availability_zone      = "us-west-2b"
  key_name               = "PGEDev"
  vpc_security_group_ids = ["sg-092e3cff65cb26403"]
  monitoring             = true
  subnet_id              = "subnet-0f1370fcdde0b76bd"
  iam_instance_profile   = "PGE-SSM-Connect"
  instance_type          = "t2.micro"
  count                  = 1

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 10
    delete_on_termination = true
  }

  ebs_block_device {
    device_name           = "/dev/xvdb"
    volume_type           = "gp2"
    volume_size           = 200
    delete_on_termination = true
  }

  tags = {
    Name = "PGE-ECM-Terraform-EC2"
  }
}