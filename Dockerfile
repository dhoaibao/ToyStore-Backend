FROM postgres:16.8-alpine

# Install build dependencies for pgvector
RUN apk add --no-cache \
    build-base \
    clang \
    llvm \
    git \
    postgresql-dev \
    && rm -rf /var/cache/apk/*

# Clone and install pgvector
RUN git clone --branch v0.8.0 https://github.com/pgvector/pgvector.git /tmp/pgvector \
    && cd /tmp/pgvector \
    && make \
    && sudo make install \
    && rm -rf /tmp/pgvector