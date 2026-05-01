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
	migrate:
	uv run python manage.py migrate tasks 0002_initial --fake
	uv run python manage.py migrate

lint:
	uv run ruff check .