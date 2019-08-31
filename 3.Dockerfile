FROM golang:1.11-alpine

RUN apk add --no-cache make gcc musl-dev linux-headers git

WORKDIR /app

RUN mkdir /app/projects
COPY . /app/projects
RUN chmod +x /app/projects/build.sh && /app/projects/build.sh

ENV PATH /app/quorum/build/bin:$PATH

CMD ["/app/projects/run3.sh"]

EXPOSE 32002/tcp 60002/tcp 31002/tcp 8545/tcp 8546/tcp 30303/tcp 32002/udp 60002/udp 31002/udp 8545/udp 8546/udp 30303/udp