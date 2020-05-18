FROM wordpress:latest

ENV PORT 8080
EXPOSE $PORT

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /tmp/wp-cli.phar && \
    chmod +x /tmp/wp-cli.phar && \
    mv /tmp/wp-cli.phar /usr/local/bin/wp

RUN curl https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -o /usr/local/bin/cloud_sql_proxy && \ 
    chmod +x /usr/local/bin/cloud_sql_proxy

WORKDIR /var/www/html

COPY php.ini /usr/local/etc/php/php.ini
COPY wp-config.php /usr/src/wordpress/wp-config.php
COPY cloud-sql-entrypoint.sh /root/cloud-sql-entrypoint.sh
COPY docker-entrypoint.sh /root/docker-entrypoint.sh

RUN cd /usr/src/wordpress && chown www-data:www-data wp-config.php

ENTRYPOINT ["/root/cloud-sql-entrypoint.sh", "/root/docker-entrypoint.sh"]
CMD ["apache2-foreground"]