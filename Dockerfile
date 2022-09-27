FROM openjdk:17.0.1-jdk-slim
COPY --from=build /var/lib/jenkins/workspace/ci-cd-webhook-pipeline/projectFolder/DevOpsModuleSampleApp/target/BaloonTask-0.0.1-SNAPSHOT.jar /usr/local/lib/demo.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","/usr/local/lib/demo.jar"]
