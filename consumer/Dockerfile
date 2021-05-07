FROM dependencies AS builder
WORKDIR /kafka-go-example
COPY kafka.config ./
ADD consumer ./consumer
RUN  go build -o consumer -ldflags '-linkmode external -w -extldflags "-static"' ./consumer

FROM alpine:latest AS production
COPY --from=builder /kafka-go-example/consumer/consumer /kafka-go-example/kafka.config /bin/
RUN ls 

ENTRYPOINT [ "/bin/consumer" ]
CMD ["-f", "/bin/kafka.config", "-t", "test1"]