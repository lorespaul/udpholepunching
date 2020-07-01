FROM openjdk:8
COPY ./build/ /usr/src/udpserver
WORKDIR /usr/src/udpserver
RUN find -name "*.java" > sources.txt
RUN javac @sources.txt
CMD ["java", "Server"]
