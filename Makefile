METABASE_BASE_VERSION ?= v0.46.3
build-metabase-arm-image:
	docker build -t metabase/metabase:$(METABASE_BASE_VERSION)-arm metabase-arm/. --build-arg METABASE_BASE_VERSION=$(METABASE_BASE_VERSION)

make run:
	@docker-compose up -d
	@echo
	@echo "pdAdmin accessible on http://localhost:5050/"
	@echo "Metabase accessible on http://localhost:3000/"

make stop:
	@docker-compose down