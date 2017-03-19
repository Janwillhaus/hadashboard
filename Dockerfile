FROM ruby:2.2
LABEL org.freenas.interactive="false" \
      org.freenas.version="1" \
      org.freenas.upgradeable="true" \
      org.freenas.expose-ports-at-host="true" \
      org.freenas.autostart="true" \
      org.freenas.web-ui-protocol="http" \
      org.freenas.web-ui-port="3030" \
      org.freenas.web-ui-path="" \
      org.freenas.port-mappings="3030:3030/tcp" \
      org.freenas.volumes="[						\
          {								\
              \"name\": \"/app/dashboards\",					\
              \"descr\": \"Dashboards\"			\
          },								\
          {								\
             \"name\": \"/app/hapush\",					\
             \"descr\": \"Hapush\"			\
          },
          {								\
             \"name\": \"/app/lib\",					\
             \"descr\": \"Lib\"			\
          },
      ]"
      
MAINTAINER Jan Willhaus <mail@janwillhaus.de>

RUN apt-get update \
 && apt-get install -y \
      sqlite \
      nodejs \
      libpq-dev \
      libssl-dev \
      libsqlite3-dev \
      ruby-dev \
      python3 \
      python3-pip \
 && mkdir /app \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN gem install dashing \
 && gem install bundler \
 && bundle \
 && pip3 install daemonize sseclient configobj beautifulsoup4 \
 && pip3 install --upgrade requests


EXPOSE 3030

VOLUME /app/lib /app/dashboards /app/hapush

CMD /app/hapush/hapush.py -d /app/hapush/hapush.cfg && dashing start
