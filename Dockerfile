FROM golang:1.22-alpine AS builder

WORKDIR /app
COPY . .

RUN go mod init fullcycle
RUN go mod tidy

RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o /fullcycle .

FROM gcr.io/distroless/static

WORKDIR /

COPY --from=builder /fullcycle .

EXPOSE 8080

CMD ["/fullcycle"]