FROM golang:alpine AS builder
RUN mkdir /build
ADD go.mod go.sum hello.go /build/
WORKDIR /build
RUN go build

FROM alpine
COPY --from=builder /build/hello-paas /app/
COPY views/ /app/views
WORKDIR /app
CMD ["./hello-paas"]
