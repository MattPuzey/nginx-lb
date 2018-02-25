FROM ubuntu:17.10
MAINTAINER Matthew Puzey "mpuzey1@outlook.com"

RUN apt-get -y update
RUN apt-get -y install rubygems puppet
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN gem install librarian-puppet
RUN apt-get -y -q install wget git-core
ADD . /

RUN librarian-puppet install