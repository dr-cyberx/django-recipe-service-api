FROM python:3.11-alpine
LABEL maintainer="drcyberx@gmail.com"

ENV PYTHONNUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

RUN python -m venv /py && \
    /py/bin/pip install --no-cache-dir --upgrade pip && \
    /py/bin/pip install --no-cache-dir -r /tmp/requirements.txt && \
    rm -rf /tmp && \
    adduser \
    --disabled-password \
    --no-create-home \
    django-user

ENV PATH="/py/bin:$PATH"

USER django-user