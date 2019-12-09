# RUN DOCKER
docker-cli:
	cd docker && docker-compose $(cmd)

# DOCKER
docker-up:
	make docker-cli cmd="up -d"
docker-down:
	make docker-cli cmd="down"
docker-logs:
	make docker-cli cmd="logs -f"
docker-ps:
	make docker-cli cmd="ps"
docker-build:
	make docker-cli cmd="build"
docker-build-no-cached:
	make docker-cli cmd="build --no-cache"
docker-exec:
	make docker-cli cmd="exec $(srv) $(cmd)"
docker-run:
	make docker-cli cmd="run $(srv) $(cmd)"

# MAIN COMMANDS
start:
	make docker-up
stop:
	make docker-down
restart:
	make stop && \
	make start
build:
	make docker-build-no-cached
reload:
	make build && \
	make restart
status:
	make docker-ps
logs:
	make docker-logs