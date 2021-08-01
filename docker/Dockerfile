FROM openjdk:8-jdk-alpine
ADD https://github.com/aws-observability/aws-otel-java-instrumentation/releases/latest/download/aws-opentelemetry-agent.jar /opt/aws-opentelemetry-agent.jar
ENV JAVA_TOOL_OPTIONS=-javaagent:/opt/aws-opentelemetry-agent.jar
ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh wait-for-it.sh
RUN chmod +x wait-for-it.sh
ENV SPRING_PROFILES_ACTIVE docker
ARG ARTIFACT_NAME
COPY ${ARTIFACT_NAME}.jar app.jar
ENTRYPOINT ["java", "-jar","/app.jar"]