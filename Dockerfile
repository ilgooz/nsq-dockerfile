FROM ubuntu:latest

RUN apt-get update \
 && apt-get install -y curl

RUN cd /tmp && curl -L -O http://github.com/bitly/nsq/releases/download/v0.3.5/nsq-0.3.5.linux-amd64.go1.4.2.tar.gz
RUN cd /tmp && tar -C /tmp -xzf nsq-*
RUN mkdir /nsq_bin
RUN cd /tmp && cd nsq-* && cp bin/* /nsq_bin

RUN cd /    && ln -s /nsq_bin/* . \
 && cd /bin && ln -s /nsq_bin/* .

EXPOSE 4150 4151 4160 4161 4170 4171

VOLUME /data
VOLUME /etc/ssl/certs
