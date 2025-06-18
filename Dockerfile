# Dockerfile para aplicação Springy
FROM php:8.1-fpm

# Argumentos de build
ARG user=springy
ARG uid=1000

# Define o diretório de trabalho
WORKDIR /var/www

# Instala dependências do sistema
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libzip-dev \
    libicu-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Instala extensões PHP
RUN docker-php-ext-install \
    pdo_mysql \
    mbstring \
    exif \
    pcntl \
    bcmath \
    gd \
    zip \
    intl

# Instala o Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Cria usuário do sistema para execução
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

# Configura o PHP
COPY docker/php/php.ini /usr/local/etc/php/conf.d/custom.ini

# Copia os arquivos do projeto
COPY . /var/www
COPY .env /var/www/.env

# Configura permissões
RUN chown -R $user:$user /var/www
# Cria os diretórios storage e var antes de modificar suas permissões
RUN mkdir -p /var/www/storage /var/www/var
RUN chmod -R 755 /var/www/storage /var/www/var

# Define o usuário
USER $user

# Instala dependências do Composer
RUN composer install --no-interaction --optimize-autoloader --no-dev

# Expõe a porta 9000 (PHP-FPM)
EXPOSE 9000

# Inicia o PHP-FPM
CMD ["php-fpm"]