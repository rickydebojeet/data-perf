FROM php:8.0-apache
WORKDIR /var/www/html

RUN mkdir /var/www/data
COPY server.php server.php
COPY data.txt /var/www/data/
RUN touch /var/www/data/writeData.txt
RUN chmod 777 /var/www/data/data.txt
RUN chmod 777 /var/www/data/writeData.txt

EXPOSE 80
