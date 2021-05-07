FROM golang:1.16.3 AS builder

RUN git clone https://github.com/edenhill/librdkafka.git

WORKDIR /go/librdkafka
RUN ./configure --prefix /usr
RUN make 
RUN make install

WORKDIR /kafka-go-example
ENV GO111MODULE=on
ENV GOOS=linux
COPY go.mod go.sum ./
ADD pkg ./pkg
RUN go mod download