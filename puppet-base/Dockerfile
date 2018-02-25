FROM alpine:3.5
MAINTAINER Matthew Puzey "mpuzey1@outlook.com"

RUN echo http://dl-4.alpinelinux.org/alpine/edge/testing/ >> /etc/apk/repositories

RUN apk update
RUN apk add shadow ruby less bash ruby-dev build-base libffi-dev
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN gem install puppet --no-rdoc -no-ri
RUN gem install librarian-puppet

RUN apk add ca-certificates wget
RUN apk add git
ADD . /
#
#RUN puppet module install puppetlabs/apk
#RUN librarian-puppet install