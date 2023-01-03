compose := docker compose
run := $(compose) run --rm web
tootctl := $(run) bin/tootctl
create := $(tootctl) accounts create

setup-target:= .make-setup

.PHONY: help
help:
	@echo "Targets:"
	@echo "  clean    Stop and remove all service containers and data volumes"
	@echo "  help     Display this help (default)"
	@echo "  serve    Start the service containers (runs setup as needed)"
	@echo "  setup    Set up the database"

.PHONY: clean
clean:
	$(compose) down --volumes
	rm -rf data
	rm -rf $(setup-target)
	@echo "✅ Successfully stopped and removed all service containers and data volumes"

.PHONY: setup
setup: $(setup-target)
$(setup-target):
	$(run) bin/rails db:setup
	$(run) bin/setup
	$(create) alicea --email alice.admin@example.edu --confirmed --role Admin
	$(create) mikem --email mike.moderator@example.edu --confirmed --role Moderator
	$(create) oliviao --email olivia.owner@example.edu --confirmed --role Owner
	touch $(setup-target)
	@echo "✅ Successfully set up the test database"
	@echo
	@echo "Run \"make serve\" to start the service containers."

.PHONY: serve
serve: $(setup-target)
	$(compose) up -d proxy
	@echo "✅ Successfully started the service containers"
	@echo
	@echo "Mastodon server: https://localhost"
	@echo "SAML logout:     http://localhost:8080/simplesaml/module.php/core/authenticate.php?as=example-userpass&logout"
	@echo
	@echo "When finished, run \"make clean\" to stop and remove all service containers and data volumes."
