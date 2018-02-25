FROM puppet-base
MAINTAINER Matthew Puzey "mpuzey1@outlook.com"

RUN apt-get -y -q install wget git-core
ADD . /

ADD nginx.conf /etc/nginx/
RUN librarian-puppet install

EXPOSE 80 32768

CMD ["puppet", "apply", "/nginx.pp"]