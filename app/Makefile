PY = python -W ignore:DeprecationWarning
MANAGE = $(PY) manage.py

help:
	@echo "migrate - Update the database with any recent model changes"
	@echo "requirements - Install python libraries"
	@echo "run - run the local development server for testing/debugging purposes"
	@echo "test - run all of the app's tests and print a coverage report"

migrate:
	@$(MANAGE) makemigrations
	@$(MANAGE) migrate --noinput

requirements:
	sudo pip install -r requirements.txt

run: requirements migrate
	@$(MANAGE) runserver 0.0.0.0:8000

test: requirements migrate
	# run tests with a coverage report
	@$(MANAGE) makemigrations
	@$(MANAGE) migrate
	$(PY) coverage erase
	$(PY) coverage run --source='.' manage.py test apps radio
	$(PY) coverage report -m
	$(PY) coverage xml
