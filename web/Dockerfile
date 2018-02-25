FROM puppet-base
MAINTAINER Matthew Puzey "mpuzey1@outlook.com"

#ADD nginx.conf /etc/nginx/
ADD . /
ADD nginx.pp /nginx.pp

EXPOSE 80 32768

RUN ls -l /
RUN pwd

#RUN puppet apply /nginx.pp
#CMD ["puppet", "apply", "nginx.pp"]