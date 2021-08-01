# Login
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com

# Build
docker build -t $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/spring-petclinic-msa/prometheus-server:latest

# Push
docker push $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/spring-petclinic-msa/prometheus-server:latest