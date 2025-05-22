FROM debian:bullseye-slim

# Set environment variables
ENV HUGO_VERSION=0.147.5 \
    HUGO_BINARY=hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

# Install necessary packages
RUN apt-get update && apt-get install -y \
    wget \
    git \
    && rm -rf /var/lib/apt/lists/*

# Download and install Hugo
RUN wget -q https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} && \
    tar xzf ${HUGO_BINARY} && \
    mv hugo /usr/local/bin/ && \
    rm ${HUGO_BINARY}

# Set working directory
WORKDIR /app

# Expose port for Hugo server
EXPOSE 1313

# Command to run when container starts
CMD ["hugo", "server", "--bind", "0.0.0.0", "-D"]