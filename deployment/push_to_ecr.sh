# Get AWS account ID
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

print $ACCOUNT_ID
# Login to ECR
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.ap-south-1.amazonaws.com

# Tag your image
docker tag django-app:latest $ACCOUNT_ID.dkr.ecr.ap-south-1.amazonaws.com/django-app:latest

# Push to ECR
docker push $ACCOUNT_ID.dkr.ecr.ap-south-1.amazonaws.com/django-app:latest