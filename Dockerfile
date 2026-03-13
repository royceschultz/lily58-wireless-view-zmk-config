FROM docker.io/zmkfirmware/zmk-build-arm:3.5

WORKDIR /workspace

# Initialize west workspace with the user config
COPY config/west.yml /workspace/config/west.yml

RUN west init -l config && west update

# Cache the Zephyr modules so rebuilds are fast
RUN west zephyr-export

# The user config is mounted at runtime via docker-compose
