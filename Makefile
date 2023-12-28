DJANGO_CONTAINER ?= django_app
POSTGRES_CONTAINER ?= postgres

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

django_shell:  ## Enters django container
	docker exec -it ${DJANGO_CONTAINER} sh

django_orm:  ## Enters django ORM
	docker exec -it ${DJANGO_CONTAINER} sh -c "./manage.py shell_plus"

postgres_shell:  ## Enters postgres container
	docker exec -it ${POSTGRES_CONTAINER} sh

start:  ## Start all containers
	docker compose up

stop:  ## Stop all containers
	docker compose stop

clean:  ## Delete all containers
	docker compose down