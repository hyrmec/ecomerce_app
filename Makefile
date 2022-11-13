APP_BIN = app/build/app

lint:
	golangci-lint run

build: clean $(APP_BIN)

clean:
	rm -rf ./app/build || true


swagger:
	swag init -g ./app/cmd/app/main.go -o ./app/docs


migrate:
	$(APP_BIN) migrate -version $(version)

migrate.down:
	$(APP_BIN) migrate -seq down

migrate.up:
	$(APP_BIN) migrate -seq up