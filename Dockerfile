FROM openjdk:8-jre-slim
ARG BUILD_ID

ENV JAVA_OPTIONS -Xms200m \
    Dcom.sun.management.jmxremote.ssl=false \
    -Dcom.sun.management.jmxremote.authenticate=false \
    -Dcom.sun.management.jmxremote.port=5000 \
    -Dcom.sun.management.jmxremote.rmi.port=5000 \
    -Dcom.sun.management.jmxremote.host=0.0.0.0 \                            
    -Djava.rmi.server.hostname=192.168.10.1
ENV BUILD_ID ${BUILD_ID}
WORKDIR /opt/app
COPY ./target/my-app-1.0-SNAPSHOT.jar /opt/app/${BUILD_ID}.jar
COPY ./Docker-Entrypoint.sh .
RUN chmod +x Docker-Entrypoint.sh
ENTRYPOINT ["./Docker-Entrypoint.sh"]
