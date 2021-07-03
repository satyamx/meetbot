#!/bin/bash

source venv/bin/activate

celery -A meetbot.routes.celery worker --loglevel=info