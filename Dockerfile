# Build stage
FROM golang:1.25-bookworm AS builder

WORKDIR /app

# Copy go mod files first for better caching
COPY go.mod go.sum ./
RUN go mod download

# Copy source code
COPY . .

# Build arguments for version info
ARG VERSION=dev
ARG COMMIT=unknown
ARG BUILD_TIME=unknown

# Build static binary
RUN CGO_ENABLED=0 go build \
    -trimpath \
    -ldflags="-s -w \
        -X 'example.com/myproject/internal/buildinfo.Version=${VERSION}' \
        -X 'example.com/myproject/internal/buildinfo.Commit=${COMMIT}' \
        -X 'example.com/myproject/internal/buildinfo.BuildTime=${BUILD_TIME}'" \
    -o myproject \
    .

# Runtime stage - use distroless for minimal attack surface
FROM gcr.io/distroless/static-debian12:nonroot

LABEL org.opencontainers.image.title="myproject"
LABEL org.opencontainers.image.source="https://github.com/example/myproject"

# Copy binary from builder
COPY --from=builder /app/myproject /myproject

USER nonroot:nonroot

ENTRYPOINT ["/myproject"]
