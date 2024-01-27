#!/bin/bash
set -e

echo "SM-backend:boot:env:${APP_ENVIRONMENT}"

python manage.py makemigrations

python manage.py migrate
python manage.py collectstatic --noinput

if [ "$APP_ENVIRONMENT" == "Local" ]; then
  echo "SM-backend:run:local" && python manage.py runserver 0.0.0.0:8080 --insecure
fi

if [ "$APP_ENVIRONMENT" == "Production" ]; then
  echo "SM-backend:run:prod" && /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisor-backend.conf
fi