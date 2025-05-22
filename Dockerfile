FROM alpine:3.18

# Set environment variables
ENV HUGO_VERSION=0.147.5 \
    HUGO_BINARY=hugo_${HUGO_VERSION}_Linux-amd64.tar.gz

# Install necessary packages
RUN apk add --no-cache \
    wget \
    git \
    ca-certificates

# Download and install Hugo
RUN wget -q https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} && \
    tar xzf ${HUGO_BINARY} && \
    mv hugo /usr/local/bin/ && \
    rm ${HUGO_BINARY}

# Set working directory
WORKDIR /src

# Expose port for Hugo server
EXPOSE 1313

# Command to run when container starts
CMD ["hugo", "server", "--bind", "0.0.0.0", "-D"]