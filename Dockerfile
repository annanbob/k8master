
FROM golang:1-alpine as build

WORKDIR /opt/go_app/workingapp
COPY . .
RUN go build hello.go


#FROM golang:1-alpine as build

#WORKDIR /app
#COPY cmd cmd
#RUN go build hello.go

FROM alpine:latest

WORKDIR /app
COPY --from=build /opt/go_app/workingapp/hello /app/hello

EXPOSE 8180
ENTRYPOINT ["./hello"]
