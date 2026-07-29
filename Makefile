IMAGE ?= vdisk
VERSION := $(shell cat VERSION)

.PHONY: build run up down logs shell clean

build:
	docker build -t $(IMAGE):$(VERSION) -t $(IMAGE):latest .

run:
	docker run --rm --name vdisk $(IMAGE):$(VERSION)

up:
	docker compose up -d --build

down:
	docker compose down

logs:
	docker compose logs -f

shell:
	docker run --rm -it --entrypoint /bin/sh $(IMAGE):$(VERSION)

clean:
	docker compose down --remove-orphans
	docker image rm $(IMAGE):$(VERSION) $(IMAGE):latest 2>/dev/null || true
