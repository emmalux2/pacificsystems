
T2 Micro DevOps Project

Overview
This project demonstrates provisioning an AWS t2.micro EC2 instance using Terraform, installing Nginx automatically, configuring a Security Group, and setting up CloudWatch monitoring 


Architecture
EC2 t2.micro→ Free-tier server
Nginx Web Server→ Displays a simple HTML page
Security Group→ Allows SSH (port 22) and HTTP (port 80)
CloudWatch Alarm→ Monitors CPU usage

Deployment Steps
1. Clone this repository:
 bash
   git clone https://github.com/emmalux2/pacificsystems.git
   cd pacificsystems
2.  Initialize Terraform:
cd terraform
terraform init
3. Plan Terraform changes:
terraform plan

4. Apply Terraform (creates EC2 and resources):
terraform apply

5. Confirm resources created and check your EC2 public IP in browser for the website.
Cost Awareness
Uses AWS free-tier (t2.micro)
CloudWatch alarms are free-tier friendly

AUTHOR: IWEBOR EMMANUEL
