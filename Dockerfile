FROM ruby:2.7.0

RUN gem install sprockets -v 3.7.2
RUN gem install rails -v 6.0.2
RUN apt-get update
RUN apt-get install -y nodejs

WORKDIR /messageBoard

ADD . /messageBoard/
#COPY /config/database.yml /messageBoard/config

COPY *.sh /

RUN groupadd -r messageBoard -g 43210 && useradd -u 43202 -r -g messageBoard -m -d /home/messageBoard -s /sbin/nologin -c "messageBoard user" messageBoard && \
    chmod -R 755 /home/messageBoard

RUN chown -R root:messageBoard /messageBoard && chmod 755 /messageBoard && \
    find /messageBoard -type f -exec chmod 664 {} \; && \
    find /messageBoard -type d -exec chmod 775 {} \; && \
    find /messageBoard -type d -exec chmod g+s {} \;

RUN chmod 775 /messageBoard/log
RUN chmod -R 775 /messageBoard/log
RUN chmod 775 /entrypoint.sh
RUN chown -R messageBoard tmp/cache
RUN chown -R messageBoard /usr/local

USER messageBoard

EXPOSE 80 443 3000

ENTRYPOINT ["/entrypoint.sh"]