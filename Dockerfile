FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y curl jq

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
