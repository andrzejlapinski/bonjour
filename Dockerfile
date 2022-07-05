FROM docker.io/ubuntu:latest 
RUN  apt-get update -y && apt-get upgrade -y && apt-get install file build-essential git gcc golang-go -y
RUN go env -w GOPROXY=direct GOFLAGS="-insecure"
COPY ./go.mod .
COPY ./go.sum .
COPY ./server/main.go .
RUN go mod tidy
RUN go build -o server .
RUN file server
