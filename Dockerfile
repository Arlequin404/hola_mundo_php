# Usa una imagen base de PHP con Apache
FROM php:8.1-apache

# Copia los archivos de la aplicación al contenedor
COPY . /var/www/html/

# Habilita el módulo de reescritura de Apache
RUN a2enmod rewrite

# Exponer el puerto 80 para acceder al servidor
EXPOSE 80

# Configura Apache para escuchar en el puerto 80
CMD ["apache2-foreground"]
