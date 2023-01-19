FROM python:3.10-alpine3.17

WORKDIR /app

RUN apk add --no-cache poetry
COPY poetry.lock .
COPY pyproject.toml .
# doesn't fully work yet
RUN poetry install --only main

COPY validate.py .
COPY configs configs
CMD poetry run python validate.py
