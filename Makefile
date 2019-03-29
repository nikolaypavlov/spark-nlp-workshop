PROJECT 	?= spark-nlp-workshop
BUILD_TAG 	?= $(shell cat $(CURDIR)/.version)
CURRENT_DIR = $(shell pwd)
PORT ?= 8888

.PHONY: build
build:
	docker build -t ${PROJECT} ${CURDIR}
	docker tag ${PROJECT} ${PROJECT}:${BUILD_TAG}
	docker tag ${PROJECT} ${PROJECT}:latest

.PHONY: run-bash
run-bash:
	docker run -it --rm -e LANG=C.UTF-8 -e LC_ALL=C.UTF-8 -v $(CURRENT_DIR)/data:/app/data -p ${PORT}:${PORT} ${PROJECT} /bin/bash

.PHONY: run
run:
	docker run -it --rm -e LANG=C.UTF-8 -e LC_ALL=C.UTF-8 -v $(CURRENT_DIR)/data:/app/data -p ${PORT}:${PORT} ${PROJECT}
