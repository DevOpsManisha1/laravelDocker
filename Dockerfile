# Use the php:8.2-apache base image
FROM php:8.2-apache

# Update and upgrade packages
RUN apt-get update && apt-get upgrade -y

# Set the working directory to /app
WORKDIR /app

# Copy the application code into the container
COPY . /app

# Install required dependencies for Composer
RUN apt-get install -y unzip

# Download and install Composer globally
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && rm composer-setup.php

# Install project dependencies using Composer
RUN composer install

# Copy the Apache virtual host configuration file
COPY localhost.conf /etc/apache2/sites-available/localhost.conf

# Enable the virtual host
#RUN a2ensite /etc/apache2/sites-available/localhost.conf

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD apachectl -D FOREGROUND
