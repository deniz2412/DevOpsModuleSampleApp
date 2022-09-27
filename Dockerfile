FROM eclipse-temurin:17-jdk-jammy
COPY ./target/BaloonTask-0.0.1-SNAPSHOT.jar ./
EXPOSE 8081
ENTRYPOINT ["java","-jar","./BaloonTask-0.0.1-SNAPSHOT.jar"]
