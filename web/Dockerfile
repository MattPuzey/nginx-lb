FROM puppet-base
MAINTAINER Matthew Puzey "mpuzey1@outlook.com"

#ADD nginx.conf /etc/nginx/
ADD nginx.pp /nginx.pp

RUN puppet apply --modulepath=/modules -e "class { 'nginx': }"
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
EXPOSE 80

