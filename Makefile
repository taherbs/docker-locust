# docker locust service makefile
APP_SERVICE_NAME = "locust"
APP_SERVICE_OWNER = "taherbs"
CONTAINER_NAME = "$(APP_SERVICE_OWNER)/$(APP_SERVICE_NAME)"

# get the workdir depending on the OS
ifeq ($(OS),Windows_NT)
WORK_DIR = $(CURDIR)
else
WORK_DIR = $(PWD)
endif

.PHONY: check-env
check-env:
ifeq (,$(wildcard ./.env))
    $(error .env file is not defined)
endif

.PHONY: build
build:
	docker build -t $(CONTAINER_NAME):latest .

.PHONY: standalone-run
standalone-run: check-env standalone-stop
	docker run --rm \
	--env-file .env \
	-v $(WORK_DIR)/locust-tasks:/locust \
	--name $(APP_SERVICE_NAME) \
	--hostname $(APP_SERVICE_NAME) \
	-p 8089:8089 -d $(CONTAINER_NAME)

.PHONY: standalone-stop
standalone-stop:
	docker rm -f $(APP_SERVICE_NAME) || true

.PHONY: distributed-run
distributed-run: check-env distributed-stop
	docker-compose up -d

.PHONY: distributed-stop
distributed-stop:
	docker-compose down
