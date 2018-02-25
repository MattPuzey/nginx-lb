FROM puppet-base
MAINTAINER Matthew Puzey "mpuzey1@outlook.com"

#ADD nginx.conf /etc/nginx/
ADD nginx.pp /nginx.pp

EXPOSE 80 32768

RUN pwd

#RUN puppet apply /nginx.pp
#CMD ["puppet", "apply", "nginx.pp"]