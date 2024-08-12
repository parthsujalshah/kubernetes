FROM alpine:latest
RUN apk add --no-cache bash curl tar openjdk17
ENV MAVEN_VERSION=3.8.1 \
    MAVEN_HOME=/usr/share/maven \
    MAVEN_CONFIG="/root/.m2"
RUN curl -fL https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz -o /tmp/apache-maven.tar.gz && \
    tar -xzf /tmp/apache-maven.tar.gz -C /usr/share && \
    mv /usr/share/apache-maven-${MAVEN_VERSION} /usr/share/maven && \
    ln -s /usr/share/maven/bin/mvn /usr/bin/mvn && \
    rm -f /tmp/apache-maven.tar.gz
RUN java -version && mvn -v
COPY . /app/
WORKDIR /app/
RUN mvn clean install
EXPOSE 8081
ENTRYPOINT ["mvn"]
CMD ["spring-boot:run"]
# by default mvn spring-boot:run
# spring-boot:run can be overridden using command line