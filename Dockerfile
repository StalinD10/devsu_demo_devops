FROM openjdk:17-jdk-slim AS builder

WORKDIR /app

COPY .mvn ./.mvn
COPY mvnw .
COPY pom.xml .

RUN ./mvnw dependency:go-offline

COPY src ./src

RUN ./mvnw clean package -DskipTests

FROM openjdk:17-jdk-slim

RUN groupadd -r spring && \
    useradd -r -g spring spring && \
    mkdir -p /app && \
    chown -R spring:spring /app

WORKDIR /app

COPY --from=builder --chown=spring:spring /app/target/*.jar app.jar

USER spring

HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
  CMD pgrep java > /dev/null || exit 1

CMD ["java", "-jar", "app.jar"]