# Usa una imagen base de PHP con Apache
FROM php:8.1-apache

# Copia los archivos de la aplicación al contenedor
COPY . /var/www/html/

# Habilita el módulo de reescritura de Apache
RUN a2enmod rewrite

# Cambia el puerto que Apache escucha
RUN echo "Listen 8080" >> /etc/apache2/ports.conf

# Configura el archivo de configuración de Apache para escuchar en el puerto 8080
RUN echo "<VirtualHost *:8080>" >> /etc/apache2/sites-available/000-default.conf
RUN echo "    DocumentRoot /var/www/html" >> /etc/apache2/sites-available/000-default.conf
RUN echo "</VirtualHost>" >> /etc/apache2/sites-available/000-default.conf

# Agrega la configuración de ServerName para evitar la advertencia
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Expón el puerto 8080
EXPOSE 8080

# Ejecuta Apache en primer plano
CMD ["apache2-foreground"]
