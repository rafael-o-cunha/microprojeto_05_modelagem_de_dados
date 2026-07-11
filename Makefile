include infra/.env

COMPOSE_FILE=infra/docker-compose.yml
DOCKER_COMPOSE=docker compose \
	--env-file infra/.env \
	-f $(COMPOSE_FILE)

.PHONY: up down restart logs status shell psql destroy

up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

restart:
	$(DOCKER_COMPOSE) down
	$(DOCKER_COMPOSE) up -d

reset:
	$(DOCKER_COMPOSE) down -v
	$(DOCKER_COMPOSE) up -d
	
logs:
	$(DOCKER_COMPOSE) logs -f

status:
	$(DOCKER_COMPOSE) ps

shell:
	docker exec -it $(CONTAINER_NAME) bash

psql:
	docker exec -it $(CONTAINER_NAME) \
		psql -U $(POSTGRES_USER) -d $(POSTGRES_DB)

destroy:
	$(DOCKER_COMPOSE) down -v