FROM dependencies AS builder
WORKDIR /kafka-go-example
COPY kafka.config ./
ADD producer ./producer
RUN  go build -o producer -ldflags '-linkmode external -w -extldflags "-static"' ./producer

FROM alpine:latest AS production
COPY --from=builder /kafka-go-example/producer/producer /kafka-go-example/kafka.config /bin/
RUN ls 

ENTRYPOINT [ "/bin/producer" ]
CMD ["-f", "/bin/kafka.config", "-t", "test1"]