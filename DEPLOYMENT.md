# AI-SRE Incident Response Framework - Deployment Guide

This guide helps you deploy the full incident response solution into your AWS Dev/Test environment.

---

## 🔧 Prerequisites

- AWS CLI configured with programmatic access
- AWS account with admin privileges (for dev use)
- Git, Terraform, Python 3.8+, Node.js
- Prometheus running in EKS or EC2
- An S3 bucket for Terraform backend (optional)
- Slack Webhook (for alerts)

---

## 🧱 Folder Structure

├── terraform/ # Infra as Code (IAM roles, Lambda, EventBridge)
├── lambda/ # Python-based Lambdas for anomaly detection & remediation
├── slack/ # Slack notification setup (optional)
├── eks/ # Example Prometheus + Fluent Bit configs
├── eventbridge/ # Sample rules and test events
├── DEPLOYMENT.md # This deployment guide
└── README.md


---

## Step-by-Step Deployment

### 1. Clone the Repo

git clone https://github.com/manvitha92/ai-sre-incident-response-full-code.git
cd ai-sre-incident-response-full-code

2. Deploy Infrastructure with Terraform

cd terraform
terraform init
terraform apply
This creates IAM roles, EventBridge rules, and Lambda scaffolding.

3. Deploy Lambda Functions

cd ../lambda
./deploy.sh  # or follow README to zip and upload manually

Each Lambda does:

pull-metrics: pulls metrics from Prometheus

detect-anomaly: IsolationForest detection

remediate-alert: takes action (e.g., rollback)

notify-slack: posts to Slack

4. Configure Prometheus Exporters (if needed)
Use eks/prometheus.yaml as a base to deploy exporters.

5. Setup Slack Notifications (optional)
Set your webhook URL in:
slack/slack_config.json
And link it to notify-slack Lambda.

✅ Test the End-to-End Flow
Simulate high CPU metric using test EventBridge input

Confirm:

Anomaly is detected

Alert is correlated

Notification appears in Slack

Action is taken via Lambda

Recommendations:

Use tags in CloudWatch for traceability

Enable X-Ray in Lambda for visibility

Use CloudTrail for auditing
