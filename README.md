# Self-Healing Infrastructure using Terraform and AWS Lambda
---
## Overview
This project implements an automated self-healing mechanism for AWS EC2 instances. When an EC2 instance enters a stopped state, the system automatically restarts it using AWS Lambda triggered by CloudWatch Events.

## Architecture
EC2 → CloudWatch Event → AWS Lambda → EC2 Restart

## Tools & Services
- AWS EC2
- AWS Lambda (Python)
- AWS CloudWatch
- IAM
- Terraform

## How It Works
1. EC2 instance state change is monitored by CloudWatch.
2. When the instance stops, a CloudWatch Event is triggered.
3. The event invokes an AWS Lambda function.
4. Lambda automatically restarts the EC2 instance.

## Deployment Steps
1. Configure AWS CLI
2. Run `terraform init`
3. Run `terraform apply`
4. Stop EC2 instance to test self-healing

## Outcome
- Reduced manual intervention
- Improved infrastructure resilience
- Automated recovery using Infrastructure as Code
