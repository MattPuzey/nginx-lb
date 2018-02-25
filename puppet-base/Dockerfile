FROM ubuntu:17.10
MAINTAINER Matthew Puzey "mpuzey1@outlook.com"

RUN apt-get -y update
RUN apt-get -y install rubygems
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN gem install puppet librarian-puppet
RUN apt-get -y -q install wget git-core
ADD . /

RUN librarian-puppet install