FROM alpine:latest AS build

# Add build deps
RUN apk add --no-cache go git musl-dev make

# Get source code
COPY LWN-Simulator /LWN-Simulator

# Switch to git folder 
WORKDIR /LWN-Simulator

# Clean and update dependencies
RUN rm go.mod go.sum && go mod init github.com/arslab/lwnsimulator && go mod tidy

# Add build dependencies
RUN make install-dep && ln -s /root/go/bin/statik /usr/bin/statik

# Build
RUN make build

FROM alpine:latest AS run

RUN apk add --no-cache tini

# Copy initial config
COPY config /opt/lwnsim/

# Copy built binary
COPY --from=build /LWN-Simulator/bin/lwnsimulator /opt/lwnsim/lwnsimulator

# Copy entrypoint
COPY entrypoint.sh /entrypoint.sh

WORKDIR /opt/lwnsim
EXPOSE 8000
ENTRYPOINT ["/entrypoint.sh"]
