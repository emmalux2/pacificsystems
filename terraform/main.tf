provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" resource "aws_security_group" "web_sg" {
  name        = "web-security-group"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Attach Security Group to EC2
resource "aws_network_interface_sg_attachment" "web_sg_attach" {
  security_group_id    = aws_security_group.web_sg.id
  network_interface_id = aws_instance.web.primary_network_interface_id
}
resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "t2micro-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "70"
  alarm_description   = "Alarm when CPU exceeds 70%"
  alarm_actions       = []  # Optional: add SNS later
  dimensions = {
    InstanceId = aws_instance.web.id
  }
}

 {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  user_data = file("../scripts/install_nginx.sh")

  tags = {
    Name = "t2micro-devops-server"
  }
}

