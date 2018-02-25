FROM puppet-base
MAINTAINER Matthew Puzey "mpuzey1@outlook.com"

#ADD nginx.conf /etc/nginx/
ADD . /

EXPOSE 80 32768

RUN puppet apply /nginx.pp
#CMD ["puppet", "apply", "nginx.pp"]

#CMD ["nginx"]