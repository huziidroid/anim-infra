SHELL := /bin/bash

.DEFAULT_GOAL := help

ENV ?= .env

help: ## Show help
	@grep -E '^[a-zA-Z_-]+:.*?## ' Makefile | sort | awk 'BEGIN {FS":.*?## "}; {printf "\033[36m%-24s\033[0m %s\n", $$1, $$2}'

up: ## Start stack
	docker compose --env-file $(ENV) up -d

ps: ## Show status
	docker compose ps

logs: ## Tail logs
	docker compose logs -f --tail=100

stop: ## Stop containers (keep data)
	docker compose stop

clean: ## Stop and remove containers (keep volumes)
	docker compose down

nuke: ## Remove everything including volumes
	docker compose down -v
