METABASE_BASE_VERSION ?= v0.46.3
build-metabase-arm-image:
	docker build -t metabase/metabase:$(METABASE_BASE_VERSION)-arm metabase-arm/. --build-arg METABASE_BASE_VERSION=$(METABASE_BASE_VERSION)

psql-connect-source-db:
	@echo "------------ Type in 'password' as password ------------"
	psql -h localhost -p 5400 -U user -d source-data-db -W
