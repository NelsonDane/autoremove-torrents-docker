FROM python:alpine3.12

WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt --no-cache-dir

RUN mkdir /app/logs

ENV cron="0 * * * *"
ENV TZ="America/New_York"

COPY entrypoint.sh /entrypoint.sh
RUN dos2unix /entrypoint.sh && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
