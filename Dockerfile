FROM golang:1.12-alpine

ENV GO111MODULE=on

RUN apk add --no-cache git

WORKDIR ${GOPATH}/src/github.com/container-examples/golang-webserver/
COPY . .

RUN go mod download
RUN go build -ldflags="-w -s" -o /app/webserver .


ENTRYPOINT [ "/app/webserver" ]
