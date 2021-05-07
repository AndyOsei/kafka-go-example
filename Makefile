all: build run

build-deps:
	docker build -t dependencies -f ./dependencies.Dockerfile ./

build: build-deps
	docker compose build

run: 
	docker compose up