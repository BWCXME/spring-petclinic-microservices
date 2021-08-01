FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD https://github.com/aws-observability/aws-otel-java-instrumentation/releases/latest/download/aws-opentelemetry-agent.jar /opt/aws-opentelemetry-agent.jar
ENV SPRING_PROFILES_ACTIVE docker
ARG ARTIFACT_NAME
COPY ${ARTIFACT_NAME}.jar app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]