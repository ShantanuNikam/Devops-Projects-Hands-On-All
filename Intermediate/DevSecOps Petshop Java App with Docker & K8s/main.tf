
provider "aws" {       
    region = "us-east-1"
}

resource "aws_security_group" "allow_all_traffic" {
  name        = "allow_all_traffic"
  description = "Allows all inbound and outbound traffic"
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ingress" {
     security_group_id = aws_security_group.allow_all_traffic.id
     cidr_ipv4 = "0.0.0.0/0"
     from_port = 0
     to_port = 0
     ip_protocol = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_ssh_egress" {
     security_group_id = aws_security_group.allow_all_traffic.id
     cidr_ipv4 = "0.0.0.0/0"
     from_port = 0
     to_port = 0
     ip_protocol = "-1"
}



resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-0332d564d76dbd8d6"
  instance_type = "t2.medium"
  key_name      = "my-ec2-key-pair"
  security_groups = [aws_security_group.allow_all_traffic.name]

  root_block_device {
    volume_size = 30
  }

  tags = {
    Name = "MyEC2Instance"
  }
}

