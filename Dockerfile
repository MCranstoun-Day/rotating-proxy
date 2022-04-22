FROM ruby:3.1-slim
MAINTAINER Anon <someone@shaddy.space>

RUN apt-get update && \
    apt-get install -y --no-install-recommends tor haproxy netcat && \
    rm -rf /var/lib/apt/lists/*

RUN gem install socksify

ADD start.rb /usr/local/bin/start.rb
RUN chmod +x /usr/local/bin/start.rb

ADD newnym.sh /usr/local/bin/newnym.sh
RUN chmod +x /usr/local/bin/newnym.sh

ADD haproxy.cfg.erb /usr/local/etc/haproxy.cfg.erb

EXPOSE 9050 4444

CMD /usr/local/bin/start.rb
