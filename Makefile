.DEFAULT_GOAL := help

# ─── Help ─────────────────────────────────────────────────────────────────────
.PHONY: help
help:
	@echo ""
	@echo "  bookstore-microservices"
	@echo ""
	@echo "  Local development"
	@echo "  ─────────────────────────────────────────────────"
	@echo "  make dev-up          Start all services (docker compose)"
	@echo "  make dev-down        Stop all services"
	@echo "  make dev-logs        Tail all service logs"
	@echo ""
	@echo "  Code quality"
	@echo "  ─────────────────────────────────────────────────"
	@echo "  make lint            Run pre-commit hooks on all files"
	@echo "  make lint-install    Install pre-commit hooks"
	@echo ""

# ─── Local development ────────────────────────────────────────────────────────
.PHONY: dev-up
dev-up:
	docker compose up --build -d

.PHONY: dev-down
dev-down:
	docker compose down -v

.PHONY: dev-logs
dev-logs:
	docker compose logs -f

# ─── Code quality ─────────────────────────────────────────────────────────────
.PHONY: lint
lint:
	pre-commit run --all-files

.PHONY: lint-install
lint-install:
	pre-commit install
