import requests
import os

def lambda_handler(event, context):
    webhook_url = os.environ['SLACK_WEBHOOK_URL']
    message = {
        'text': f"ALERT: {event.get('detail-type')} at {event.get('time')}"
    }
    response = requests.post(webhook_url, json=message)
    return {
        'statusCode': response.status_code,
        'body': response.text
    }
