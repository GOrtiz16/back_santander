FROM alpine:3.19
 
RUN apk update --no-cache

RUN apk upgrade --no-cache

RUN apk add openjdk17=17.0.11_p9-r0 --no-cache

RUN rm -rf /var/cache/apk/*
 
WORKDIR /app

COPY demo/target/*.jar .

ENTRYPOINT sh -c 'java -jar *-SNAPSHOT.jar'
