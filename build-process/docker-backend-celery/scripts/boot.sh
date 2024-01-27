#!/bin/bash
set -e

echo "SM-backend:boot:env:${APP_ENVIRONMENT}"


if [ "$APP_ENVIRONMENT" == "Local" ]; then
  echo "SM-backend:run:local"
fi


celery -A backend worker -l info
