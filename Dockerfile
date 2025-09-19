# Use a standard PHP image with Apache
FROM php:8.2-apache

# Install required system dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install necessary PHP extensions
RUN docker-php-ext-install pdo pdo_mysql mysqli zip

# Copy application source code
COPY . /var/www/html/

# Set correct permissions
RUN chown -R www-data:www-data /var/www/html && a2enmod rewrite
