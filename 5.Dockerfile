FROM golang:1.11-alpine

RUN apk add --no-cache make gcc musl-dev linux-headers git

WORKDIR /app

RUN mkdir /app/projects
COPY . /app/projects
RUN chmod +x /app/projects/build.sh && /app/projects/build.sh

ENV PATH /app/quorum/build/bin:$PATH

CMD ["/app/projects/run5.sh"]

EXPOSE 32004/tcp 60004/tcp 31004/tcp 8545/tcp 8546/tcp 30303/tcp 32004/udp 60004/udp 31004/udp 8545/udp 8546/udp 30303/udp