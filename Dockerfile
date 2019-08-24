FROM openjdk:8 AS builder
WORKDIR /workspace
COPY --from=cloudbees/cloudbees-core-mm:2.176.2.3 /usr/share/jenkins/jenkins.war .
ADD *.jar /workspace/jenkins-plugin-manager.jar
ADD plugins.txt /workspace/
RUN java -jar /workspace/jenkins-plugin-manager.jar --war /workspace/jenkins.war --plugin-download-directory /workspace/files --plugin-file /workspace/plugins.txt

FROM cloudbees/cloudbees-core-mm:2.176.2.3
COPY --from=builder /workspace/files/* /usr/share/jenkins/ref/plugins/
