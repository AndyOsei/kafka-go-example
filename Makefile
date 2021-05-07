all: build run

build-deps:
	docker build -t dependencies -f ./dependencies.Dockerfile ./

build: build-deps
	docker compose build --progress plain

run: 
	docker compose up