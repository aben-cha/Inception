FROM debian:12.8

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y curl ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /portainer

# -strip-components=1 : to the tar command to avoid nested directories
RUN curl -L https://github.com/portainer/portainer/releases/download/2.19.4/portainer-2.19.4-linux-amd64.tar.gz -o portainer.tar.gz \
    && tar -xzf portainer.tar.gz --strip-components=1 \ 
    && rm portainer.tar.gz

EXPOSE 9000

CMD [ "./portainer" ]