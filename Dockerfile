FROM alpine:latest

MAINTAINER yarntime "yarntime@163.com"

RUN apk update && \
	apk add --no-cache mysql && \
	addgroup mysql mysql && \
	mkdir /scripts && \
	rm -rf /var/cache/apk/*

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

ADD registry.sql /tmp/r.sql 

ADD docker-entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh  && chown -R mysql:mysql /tmp

ENTRYPOINT ["/entrypoint.sh"]
