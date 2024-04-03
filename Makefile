ROOT_DIR	:= $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
PARENTDIR   := $(realpath ../)
GITHASH 	:= $(shell git rev-parse --short HEAD)
ENVIRONMENT := testing

.PHONY:all
all:
	@echo 'Available make targets:'
	@grep '^[^#[:space:]\.PHONY.*].*:' Makefile

.PHONY:run
run:
	poetry run python3 -m flask run

.PHONY:docker-build
docker-build:
	docker build . -t devsecops-python-demo:latest

