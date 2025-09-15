FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    bash \
    netcat \
    cowsay \
    fortune-mod \
    fortunes \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

# Add /usr/games to PATH so cowsay & fortune are found
ENV PATH="/usr/games:${PATH}"

CMD ["/app/wisecow.sh"]
