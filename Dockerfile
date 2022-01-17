FROM openjdk:8-jre-slim
ARG BUILD_ID

ENV JAVA_OPTIONS -Xms200m
ENV BUILD_ID ${BUILD_ID}
WORKDIR /opt/app
COPY ./target/my-app-1.0-SNAPSHOT.jar /opt/app/${BUILD_ID}.jar
COPY ./Docker-Entrypoint.sh .
RUN chmod +x Docker-Entrypoint.sh
ENTRYPOINT ["./Docker-Entrypoint.sh"]
