#!/bin/bash

meetbot=$(pwd)

python3 -m venv $meetbot/venv 

source venv/bin/activate

pip3 install -r requirements.txt

pip3 install flask

pip3 install -U "celery[redis]"