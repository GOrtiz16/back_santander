FROM alpine:3.19
 
RUN addgroup -S appuser && adduser -S appuser -G appuser

RUN apk update --no-cache

RUN apk upgrade --no-cache

RUN apk add openjdk17=17.0.11_p9-r0 --no-cache

RUN rm -rf /var/cache/apk/*
 
WORKDIR /app

COPY demo/target/*.jar .

RUN chown -R appuser:appuser /app

USER appuser

ENTRYPOINT sh -c 'java -jar *-SNAPSHOT.jar'
