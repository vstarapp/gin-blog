FROM golang:latest
WORKDIR $GOPATH/src/gin-blog
COPY . $GOPATH/src/gin-blog
RUN go build

EXPOSE 8000
ENTRYPOINT ["./gin-blog"]