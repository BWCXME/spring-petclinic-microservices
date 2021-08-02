## Build
./mvnw clean install -P buildDocker

MIND: openjdk:8-jdk-alpine got no bash

## EKS Policy

cat > otel-admin-policy.json <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:*",
                "xray:*PutTraceSegments*",
                "cloudwath:*",
                "ssm:GetParameters",
                "synthetics:DescribeCanariesLastRun",
                "ssm-incidents:ListResponsePlans",
                "sns:*",
                "iam:GetPolicy",
                "iam:GetPolicyVersion",
                "iam:GetRole"
            ],
            "Resource": "*"
        }
    ]
}
EOF

aws iam create-policy \
    --policy-name OtelAdminPolicy \
    --policy-document file://otel-admin-policy.json

eksctl utils associate-iam-oidc-provider \
  --region=$AWS_REGION \
  --cluster=ekslab \
  --approve

eksctl create iamserviceaccount \
    --name otel-admin \
    --namespace default \
    --cluster ekslab \
    --attach-policy-arn=arn:aws:iam::${ACCOUNT_ID}:policy/OtelAdminPolicy \
    --override-existing-serviceaccounts \
    --approve

eksctl update iamserviceaccount \
    --name otel-admin \
    --namespace default \
    --cluster ekslab \
    --attach-policy-arn=arn:aws:iam::${ACCOUNT_ID}:policy/OtelAdminPolicy \
    --approve


## Deploy

## Grafana & Prometheus
1. create_repos.sh
2. grafana / prometheus
build_push.sh

cat grafana-server-deployment.yaml | envsubst | kubectl apply -f -
cat prometheus-server-deployment.yaml | envsubst | kubectl apply -f -

<!-- envsubst < grafana-server-deployment.yaml | kubectl apply -f - –  -->
https://stackoverflow.com/questions/48296082/how-to-set-dynamic-values-with-kubernetes-yaml-file

## Petclinic Services
https://github.com/patflynn/spring-petclinic-kubernetes
kubectl apply -f *service.yaml

create_ecr_repos.sh
build_packages.sh
push_to_ecr.sh


1. Config Server
cat config-server.yaml | envsubst | kubectl apply -f -

- Debug
docker run -it $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/spring-petclinic-msa/config-server --rm
cat config-server-deployment-debug.yaml | envsubst | kubectl apply -f -

2. Discovery Server
cat discovery-server.yaml | envsubst | kubectl apply -f -

- Debug
docker run -it $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/spring-petclinic-msa/discovery-server --rm
cat discovery-server-deployment-debug.yaml | envsubst | kubectl apply -f -

3. Customers/Vets/Visits
cat customers-service.yaml | envsubst | kubectl apply -f -

cat vets-service.yaml | envsubst | kubectl apply -f -

cat visits-service.yaml | envsubst | kubectl apply -f -

4. Admin/API-Gateway
cat admin-server.yaml | envsubst | kubectl apply -f -

cat api-gateway.yaml | envsubst | kubectl apply -f -

## Verify

1. Discoery Server (Close VPN first)

2. API Gateway


