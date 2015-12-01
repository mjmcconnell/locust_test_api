APP_RUNNING = $(shell docker inspect -f {{.State.Running}} locusttestapi_app_1)

# Show command line help message
help:
	@echo "The following commands are available:"
	@echo ""
	@echo "make run:		Run local development server inside container."
	@echo "make test:		Run tests."
	@echo "make locust:		Run the locust server inside container."

db:
	docker-compose -f docker-db.yml up -d --no-recreate

run-locust:
ifneq ($(APP_RUNNING), true)
	xterm -hold -e make run &
	bash -c "sleep 1"
endif

	docker-compose -f docker-locust.yml up --no-recreate

run: db
	docker-compose -f docker-app.yml up --no-recreate

test: db
	docker-compose -f docker-test.yml up
