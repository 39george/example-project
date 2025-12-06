.PHONY: add run dev build clean logs

run: dev

add:
ifndef PACKAGE
	@echo "Usage: make add PACKAGE=<package-name>"
	@exit 1
endif
	CC="clang -std=gnu99" lx --lua-version 5.1 add $(PACKAGE)

dev:
	@echo "🚀 Running Lapis server..."
	lx --lua-version 5.1 exec lapis server development --no-loader -- --config-module src.config

migration:
	lx --lua-version 5.1 exec lapis --no-loader -- generate migration --migrations-module src.db.migrations

build:
	lx --lua-version 5.1 exec lapis build

clean:
	rm -f nginx.conf.compiled logs/nginx.pid

logs:
	tail -f logs/error.log

migrate:
ifndef ENV
	@echo "Usage: make add ENV=<environment>"
	@exit 1
endif
	lx --lua-version 5.1 exec lapis --no-loader -- migrate --migrations-module src.db.migrations --config-module src.config $(ENV)

