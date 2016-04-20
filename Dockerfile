FROM ubuntu:16.04

# requirements from README
RUN apt-get update && apt-get install -y \
        curl \
        git \
        gcc \
        libnl-3-dev libnl-genl-3-dev \
        make \
        upx-ucl \
        protobuf-compiler

# Install Go
ENV GO_VERSION 1.5.4
RUN curl -fsSL "https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz" \
    | tar -xzC /usr/local
ENV PATH /go/bin:/usr/local/go/bin:$PATH
ENV GOPATH /go

RUN go get -u golang.org/x/crypto/ssh; \
    go get -u github.com/dlintw/goconf; \
    go get -u github.com/golang/glog; \
    go get -u github.com/golang/protobuf/proto; \
    go get -u github.com/golang/protobuf/protoc-gen-go; \
    go get -u github.com/miekg/dns; \
    go get -u github.com/pwaller/goupx

COPY . /go/src/github.com/google/seesaw

WORKDIR /go/src/github.com/google/seesaw

CMD ["build/run.sh"]
