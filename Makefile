build-metabase-arm-image:
	docker build -t metabase-arm:latest metabase-arm/.

make run:
	docker-compose up -d
	@echo
	@echo "pdAdmin accessible on http://localhost:5050/"
	@echo "Metabase accessible on http://localhost:3000/"

make stop:
	docker-compose down