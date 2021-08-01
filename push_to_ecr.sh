# Login
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com

# Retag
docker tag springcommunity/spring-petclinic-api-gateway:latest $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/spring-petclinic-msa/api-gateway:latest
docker tag springcommunity/spring-petclinic-discovery-server:latest $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/spring-petclinic-msa/discovery-server:latest
docker tag springcommunity/spring-petclinic-config-server:latest $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/spring-petclinic-msa/config-server:latest
docker tag springcommunity/spring-petclinic-visits-service:latest $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/spring-petclinic-msa/visits-service:latest
docker tag springcommunity/spring-petclinic-vets-service:latest $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/spring-petclinic-msa/vets-service:latest
docker tag springcommunity/spring-petclinic-customers-service:latest $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/spring-petclinic-msa/customers-service:latest
docker tag springcommunity/spring-petclinic-admin-server:latest $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/spring-petclinic-msa/admin-server:latest

# Push
docker push $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/spring-petclinic-msa/api-gateway:latest
docker push $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/spring-petclinic-msa/discovery-server:latest
docker push $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/spring-petclinic-msa/config-server:latest
docker push $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/spring-petclinic-msa/visits-service:latest
docker push $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/spring-petclinic-msa/vets-service:latest
docker push $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/spring-petclinic-msa/customers-service:latest
docker push $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/spring-petclinic-msa/admin-server:latest