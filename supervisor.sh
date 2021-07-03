#!/bin/bash

sudo touch /etc/supervisor/conf.d/celery.conf

sudo mkdir $meetbot/logs

sudo touch $meetbot/logs/worker.out.log

sudo touch $meetbot/logs/worker.err.log

echo "[program:celery]\ncommand = $meetbot/venv/bin/celery -A meetbot.routes.celery worker --loglevel=info --without-gossip -P solo\ndirectory = $meetbot\nstdout_logfile = $meetbot/logs/worker.out.log\nstderr_logfile = $meetbot/logs/worker.out.log\nautostart=true\nautorestart = true\nstartsecs = 10\nstopwaitsecs = 600\nstopasgroup=true\npriority=1000" > temp_celery.conf

sudo mv temp_celery.conf /etc/supervisor/conf.d/celery.conf

sudo supervisorctl reload
