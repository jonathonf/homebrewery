FROM alpine:latest

RUN apk --no-cache -U -f upgrade && \
    apk --no-cache -U add nodejs nodejs-npm mongodb

VOLUME [ "/data/db" ]
EXPOSE 8000

COPY . /app/naturalcrit
WORKDIR /app/naturalcrit

RUN chmod +x start.sh && \
    npm install && \
    npm build

CMD [ "/app/naturalcrit/start.sh" ]
