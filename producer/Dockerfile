FROM dependencies AS builder
WORKDIR /app
COPY ./producer/ .
COPY ./kafka.config .
RUN go mod download
RUN  go build -o producer -ldflags '-linkmode external -w -extldflags "-static"' .

FROM alpine:latest AS production
COPY --from=builder /app/producer /app/kafka.config /bin/
RUN ls 

ENTRYPOINT [ "/bin/producer" ]
CMD ["-f", "/bin/kafka.config", "-t", "test1"]