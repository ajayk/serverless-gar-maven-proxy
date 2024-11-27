
FROM golang:1.23.3-alpine3.20 AS build
RUN apk add --no-cache git ca-certificates
WORKDIR /src/app
COPY . .
RUN go build -o /app

FROM alpine
RUN apk add --no-cache ca-certificates
COPY --from=build /app /app


ENTRYPOINT [ "/app" ]
