import boto3

ec2 = boto3.client('ec2')

def lambda_handler(event, context):
    instance_id = event['detail']['instance-id']
    
    ec2.start_instances(
        InstanceIds=[instance_id]
    )
    
    print(f"EC2 instance restarted: {instance_id}")
