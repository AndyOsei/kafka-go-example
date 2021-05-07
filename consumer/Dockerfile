FROM dependencies AS builder
WORKDIR /app
COPY ./consumer/ .
COPY ./kafka.config .
RUN  go build -o consumer -ldflags '-linkmode external -w -extldflags "-static"' .

FROM alpine:latest AS production
COPY --from=builder /app/consumer /app/kafka.config /bin/
RUN ls 

ENTRYPOINT [ "/bin/consumer" ]
CMD ["-f", "/bin/kafka.config", "-t", "test1"]