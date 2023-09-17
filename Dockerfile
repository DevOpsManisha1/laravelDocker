From  php:8.2-apache

RUN apt-get update && apt-get upgrade -y
WORKDIR /app

COPY . /app

RUN composer install 

COPY localhost.conf /etc/apache2/sites-available/localhost.conf
RUN a2ensite /etc/apache2/sites-available/localhost.conf


EXPOSE 80 

CMD apachectl -d FORGROUND 