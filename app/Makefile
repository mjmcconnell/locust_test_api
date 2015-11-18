PY = python -W ignore:DeprecationWarning
MANAGE = $(PY) manage.py

help:
	@echo "run - run the local development server for testing/debugging"

requirements:
	sudo pip install -r requirements.txt

run: requirements
	@$(MANAGE) makemigrations api
	@$(MANAGE) migrate --noinput
	@$(MANAGE) runserver 0.0.0.0:8000

test:
	@echo "HELLO XXXXXXXXXXXXXXXXXX"
