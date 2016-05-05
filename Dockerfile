FROM node:5.7.1

RUN mkdir -p /data/app/bin && mkdir -p /data/app/scripts

RUN apt-get -y update
RUN apt-get -y install supervisor python-pip
RUN easy_install -U pip
RUN pip install supervisor-stdout
RUN mkdir -p /var/log/supervisor

# Supervisor Configuration
ADD ./supervisord/conf.d/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD ./supervisord/conf.d/hubot.conf /etc/supervisor/conf.d/hubot.conf

ADD ./bin /data/app/bin
ADD ./scripts /data/app/scripts
ADD ./*.json /data/app/

RUN cd /data/app && npm install

CMD ["supervisord", "-n"]


