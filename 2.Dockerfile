FROM golang:1.11-alpine

RUN apk add --no-cache make gcc musl-dev linux-headers git

WORKDIR /app

RUN mkdir /app/projects
COPY . /app/projects
RUN chmod +x /app/projects/build.sh && /app/projects/build.sh

ENV PATH /app/quorum/build/bin:$PATH

CMD ["/app/projects/run2.sh"]

EXPOSE 32001/tcp 60001/tcp 31001/tcp 8545/tcp 8546/tcp 30303/tcp 32001/udp 60001/udp 31001/udp 8545/udp 8546/udp 30303/udp