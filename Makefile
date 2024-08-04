include .env

.DEFAULT_GOAL = build

.PHONY = build

build:
	go build cmd/main.go

run:
	go run cmd/main.go

clean:
	rm -rf main main.exe

migrate:
	migrate create -dir migrations -seq -ext sql $(name)

migrate_up:
	migrate -path migrations -database postgres://$(PG_USER):$(PG_PWD)@$(PG_HOST):$(PG_PORT)/$(PG_DB)?sslmode=$(PG_SSL_MODE) up $(v)

migrate_down:
	migrate -path migrations -database postgres://$(PG_USER):$(PG_PWD)@$(PG_HOST):$(PG_PORT)/$(PG_DB)?sslmode=$(PG_SSL_MODE) down $(v)

migrate_fix:
	migrate -path migrations -database postgres://$(PG_USER):$(PG_PWD)@$(PG_HOST):$(PG_PORT)/$(PG_DB)?sslmode=$(PG_SSL_MODE) force $(v)