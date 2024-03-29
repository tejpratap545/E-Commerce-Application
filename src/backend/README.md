
# Backend For E-commerce-Application

## Build Setup

## Using docker and docker compose ( run these command at the root of project )

```bash

# create .env file at src/backend
  DATABASE_URL=psql://shopit:shopit@postgres:5432/shopitdb
  DJANGO_ALLOWED_HOSTS=127.0.0.1,0.0.0.0,192,168.43.229,34.229.131.219
  AZURE_ACCOUNT_NAME=
  AZURE_ACCOUNT_KEY=
  SENDGRID_API_KEY=
  SENDGRID_USER_NAME=
  SENTRY_DSN=
  RABBITMQ_URL=amqp://shopit:shopit@rabbitmqasgi
  CELERY_BROKER_URL=amqp://shopit:shopit@rabbitmq:5672//
  REDIS_URL=redis://127.0.0.1:6379/1
  STRIPE_PUBLISHABLE_KEY=
  STRIPE_SECRET_KEY=
  OPEN_EXCHANGE_RATES_APP_ID=


# build container and compose up
$ docker-compose  up

# run docker containers in background mode

$ docker-compose up -d

# start celery worker and beat
# not necessary for frontend devlopement

$ docker-compose run django celery -A config.celery_app worker -l INFO
$ docker-compose run django beat -A config.celery_app worker -l INFO
$ docker-compose run django beat -A flower --app=config.celery_app --basic_auth="username:password"


# db backup and restore
$ docker exec -i postgres pg_dump -U shopit shopitdb -a > src/backend/dbbackup/dbdump-$(uname -n)_$(date +%F-%T).psql

$ cat src/backend/dbbackup/latest_dump_file.sql | docker exec -i postgres psql -U shopit shopitdb

```

## Manual Build Setup

### 1. Must install rabbitmq, postgresql , redis, mailhog

#### If not install create docker-compose.yml  file anywhere with this content

    version: "3"
    services:
      rabbitmq:
        image: rabbitmq:3-management-alpine
        container_name: rabbitmq
        volumes:
          - rabbitmqmain:/etc/rabbitmq/
          - rabbitmqdata:/var/lib/rabbitmq/
          - rabbitmqlogs:/var/log/rabbitmq/
        environment:
          RABBITMQ_DEFAULT_USER: username
          RABBITMQ_DEFAULT_PASS: password
        ports:
          - 5672:5672
          - 15672:15672
      postgrs:
        image: postgres
        container_name: postgres
        volumes:
        - pgdata:/var/lib/postgresql/data
        environment:
          POSTGRES_PASSWORD: password
          POSTGRES_DB: dbname
          POSTGRES_USER: password
        ports:
        - 5432:5432
      redis:
        image: redis
        container_name: redis
        volumes:
        - redisdata:/var/lib/redis
        ports:
        - 6379:6379
      mailhog:
        image: mailhog/mailhog:latest
        container_name: mailhog
        ports:
          - 8025:8025
          - 1025:1025
    volumes:
      rabbitmqmain:
      rabbitmqdata:
      rabbitmqlogs:
      pgdata:
      redisdata:

#### after then run

     docker-compose up -d

### 2. create a python virtual environment (recommended at project root and with the name of venv ) and activate it

    cd ../..
    python3 -m venv venv
    source venv/bin/activate   # for linux and mac users
    source venv/Script/activate # for windows users

### 3. Install python requirements

    pip install -r requirements/dev.txt

### 4. Create the .env in this folder

    PYTHONUNBUFFERED=1
    DEBUG=True
    SOCIAL_AUTH_GOOGLE_OAUTH2_KEY=
    SOCIAL_AUTH_GOOGLE_OAUTH2_SECRET=
    SOCIAL_AUTH_FACEBOOK_KEY=
    SOCIAL_AUTH_FACEBOOK_SECRET=
    DATABASE_URL=psql://username:password@127.0.0.1:5432/dname
    ALLOWD_HOSTS='127.0.0.1','0.0.0.0','localhost
    AZURE_ACCOUNT_NAME=
    AZURE_ACCOUNT_KEY=
    SENDGRID_API_KEY=
    SENDGRID_USER_NAME=
    SENTRY_DSN=
    RABBITMQ_URL=amqp://username:password@127.0.0.1/asgi
    CELERY_BROKER_URL=amqp://username:password@localhost:5672//
    REDIS_URL=redis://127.0.0.1:6379/
    STRIPE_PUBLISHABLE_KEY=
    STRIPE_SECRET_KEY=
    OPEN_EXCHANGE_RATES_APP_ID=

### 5. Start django server

    python manage.py makemigrations
    python manage.py migrate
    python manage.py shell_plus
    python manage.py runserver_plus

### 6. Start celery

    celery -A config.celery_app beat -l INFO
    celery -A config.celery_app worker -l INFO
    celery -A config.celery_app events
    celery flower --app=config.celery_app --basic_auth="username:password"

### 7. To back up and Restore Database

#### Without docker

    pg_dump -U dbusername  -a dbname > dbbackup/dbdump-$(uname -n)_$(date +%F-%T).psql
    cat dbbackup/latest_dump_file.sql  

#### If database is running inside the container

     docker exec -i your-db-container pg_dump -U dbusername  -a dbname > dbbackup/dbdump-$(uname -n)_$(date +%F-%T).psql
     cat dbbackup/latest_dump_file.sql | docker exec -i your-db-container psql -U username dbname

### Default Servers locations

  1. <http://127.0.0.1:8000> - django server location
  2. <http://127.0.0.1:15672> - rabbitmq management interface
  3. <http://127.0.0.1:5555>  - celery flower interface
  4. <http://127.0.0.1:8025> - mailhog browser interface


For detailed explanation on how things work, check out [ Django docs](https://www.djangoproject.com/).
