FROM puppet-base
MAINTAINER Matthew Puzey "mpuzey1@outlook.com"

RUN apt-get -y -q install wget git-core
ADD Puppetfile /
ADD nginx.pp /

ADD nginx.conf /etc/nginx/
RUN librarian-puppet install
RUN puppet apply /nginx.pp
EXPOSE 80 32768
CMD ["nginx"]