Guide:
    - copy .env.example and rename to .env;
    - build docker container:
        `docker compose up -d`
    - install composer dependencies:
        `docker compose exec -u root app composer install`
    - run migration
        `docker compose exec -u root app /var/www/migrate -m`
