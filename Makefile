install:
	uv sync

dev:
	uv run python manage.py runserver

start:
	uv run gunicorn task_manager.wsgi

build:
	./build.sh

render-start:
	gunicorn task_manager.wsgi

collectstatic:
	uv run python manage.py collectstatic --noinput

migrate:
	uv run python manage.py migrate --fake tasks 0002_initial || true
	uv run python manage.py migrate

lint:
	uv run ruff check .

test:
	uv run pytest

test-coverage:
	uv run pytest --cov=gendiff --cov-report=xml:coverage.xml