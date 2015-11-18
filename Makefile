# Show command line help message
help:
	@echo "The following commands are available:"
	@echo ""
	@echo "    make run:     		Run local development server inside container."

run:
	docker-compose up
