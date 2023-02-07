FROM python:3.9.16-slim as base
FROM base as builder

COPY requirements.txt /
RUN pip install --user -r /requirements.txt

FROM base
COPY --from=builder /root/.local /root/.local
COPY . /app
WORKDIR /app

ENV PATH=/home/app/.local/bin:$PATH

ENTRYPOINT ["python", "app.py"]
