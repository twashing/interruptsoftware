
variable "access_key" {}
variable "secret_key" {}

provider "aws" {
  region = "us-west-1"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

resource "aws_ecs_cluster" "default" {
  name = "interruptsoftware"
}

resource "aws_ecs_service" "interruptsoftware_service" {
  name            = "interruptsoftware-service"
  cluster         = "${aws_ecs_cluster.default.id}"
  task_definition = "${aws_ecs_task_definition.interruptsoftware-task.arn}"
  desired_count   = 1
}

resource "aws_ecs_task_definition" "interruptsoftware-task" {
  family = "interruptsoftware"
  container_definitions = "${file("task-definitions/interruptsoftware.json")}"
  volume {
    name = "interruptsoftware-home"
    host_path = "/ecs/interruptsoftware-home"
  }
}

resource "aws_iam_role" "interruptsoftware" {
    name = "interruptsoftware"
    assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "interruptsoftware" {
    name = "interruptsoftware"
    path = "/"
    description = "interruptsoftware"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ecs:CreateCluster",
        "ecs:DeregisterContainerInstance",
        "ecs:DiscoverPollEndpoint",
        "ecs:Poll",
        "ecs:RegisterContainerInstance",
        "ecs:StartTelemetrySession",
        "ecs:Submit*",
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "interruptsoftware" {
    name = "interruptsoftware"
    roles = ["${aws_iam_role.interruptsoftware.name}"]
    policy_arn = "${aws_iam_policy.interruptsoftware.arn}"
}

resource "aws_iam_instance_profile" "interruptsoftware" {
    name = "interruptsoftware"
    roles = ["${aws_iam_role.interruptsoftware.name}"]
}

resource "aws_security_group" "interruptsoftware" {
  name = "interruptsoftware"
  description = "interruptsoftware"

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "interruptsoftware-instance" {
  ami = "ami-bb473cdb"
  instance_type = "t2.small"
   security_groups = ["${aws_security_group.interruptsoftware.name}"]
  iam_instance_profile = "interruptsoftware"
  user_data = "#!/bin/bash\necho ECS_CLUSTER=interruptsoftware >> /etc/ecs/ecs.config"
}

resource "aws_route53_zone" "main" {
  name = "interruptsoftware.com"
}

resource "aws_route53_record" "main-ns" {
    zone_id = "${aws_route53_zone.main.zone_id}"
    name = "interruptsoftware.com"
    type = "A"
    ttl = "300"
    records = [
        "${aws_instance.interruptsoftware-instance.public_ip}"
    ]
}
