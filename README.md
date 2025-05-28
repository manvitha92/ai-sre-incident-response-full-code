# AI-SRE Incident Response Framework

This repo includes a production-ready example of AI-augmented incident response using AWS Lambda, EventBridge, Prometheus, and Slack.

## Folders
- `lambda/`: Lambda functions for alert processing and Slack notifications
- `terraform/`: Infrastructure as Code to deploy resources
- `eventbridge/`: Example rule for CloudWatch Alarm integration
- `slack/`: Slack webhook configuration
- `eks/`: Sample Kubernetes deployment manifest

## Deployment Steps
1. Configure AWS credentials
2. Deploy with Terraform from `terraform/`
3. Set SLACK_WEBHOOK_URL as environment variable in Lambda
4. Connect CloudWatch alarms to EventBridge
