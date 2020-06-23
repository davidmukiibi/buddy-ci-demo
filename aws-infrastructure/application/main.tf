provider "aws" {
  region = "us-east-1"
}

variable "TOKEN" {}

terraform {
  backend "remote" {
    organization = "mukiibi"
    workspaces {
      name = "buddy-ci-workspace"
    }
    token = var.TOKEN
  }
}

data "aws_ami" "my_custom_ami" {
  most_recent = true
  owners      = ["self"]
}

resource "aws_vpc" "application_vpc" {
  cidr_block = "10.0.0.0/16"
  #   instance_tenancy = "dedicated"

  tags = {
    Name = "application vpc"
  }
}

resource "aws_subnet" "application_subnet" {
  vpc_id                  = aws_vpc.application_vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Main_subnet"
  }
}

resource "aws_security_group" "allow_traffic_in" {
  name                   = "allow-traffic-in"
  description            = "Allow inbound traffic"
  vpc_id                 = aws_vpc.application_vpc.id
  revoke_rules_on_delete = true

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.application_vpc.cidr_block]
  }

  ingress {
    description = "Let the database in"
    from_port   = 5432
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.application_vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_traffic_in"
  }
}

resource "aws_instance" "bucketlist_app" {
  ami               = data.aws_ami.my_custom_ami.id
  availability_zone = "us-east-1a"
  instance_type     = "t2.micro"
  security_groups   = [aws_security_group.allow_traffic_in.id]
  subnet_id         = aws_subnet.application_subnet.id

  tags = {
    Name = "Bucketlist App"
  }
}




































# provider "aws" {
#   region = "eu-west-1"
# }

# resource "aws_sns_topic" "my_sns" {
#   name = "my-sns"
# }

# module "notify_slack" {
#   source = "terraform-aws-modules/notify-slack/aws//examples/notify-slack-simple"
#   version = "3.2.0"

#   sns_topic_name   = aws_sns_topic.my_sns.name
#   create_sns_topic = false

#   slack_webhook_url = "https://hooks.slack.com/services/AAA/BBB/CCC"
#   slack_channel     = "aws-notification"
#   slack_username    = "reporter"

#   tags = {
#     Name = "notify-slack-simple"
#   }
# }


# # check here for the module sources https://github.com/terraform-aws-modules






