FROM python:3.8-slim-buster

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN apt-get update \
  # dependencies for building Python packages
  && apt-get install -y build-essential \
  # psycopg2 dependencies
  && apt-get install -y libpq-dev \
  # Translations dependencies
  && apt-get install -y gettext \
  && apt-get install -y curl wget

# upgrade pip
RUN pip install --upgrade pip

# Requirements are installed here to ensure they will be cached.
COPY ./src/backend/requirements /requirements
RUN pip install -r /requirements/common.txt --no-cache
RUN pip install -r /requirements/production.txt --no-cache



COPY ./compose/django/start /start
RUN sed -i 's/\r$//g' /start
RUN chmod +x /start


WORKDIR /app



