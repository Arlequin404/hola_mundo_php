# Usa una imagen base de PHP
FROM php:8.0-cli

# Crea un directorio de trabajo
WORKDIR /app

# Copia los archivos de la aplicación
COPY . .

# Ejecuta el servidor integrado de PHP
CMD ["php", "-S", "0.0.0.0:8000", "-t", "."]
