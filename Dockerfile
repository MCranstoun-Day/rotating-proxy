FROM ruby:2.4-alpine3.6
MAINTAINER Anon <someone@shaddy.space>

RUN apk update && \
    apk add --update tor haproxy \
    --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ && \
    rm -rf /var/cache/apk/* && \
    ln -s /lib/x86_64-linux-gnu/libssl.so.1.0.0 /lib/libssl.so.1.0.0

RUN gem install excon -v 0.44.4

ADD start.rb /usr/local/bin/start.rb
RUN chmod +x /usr/local/bin/start.rb

ADD newnym.sh /usr/local/bin/newnym.sh
RUN chmod +x /usr/local/bin/newnym.sh

ADD haproxy.cfg.erb /usr/local/etc/haproxy.cfg.erb

EXPOSE 9050 4444

CMD /usr/local/bin/start.rb
