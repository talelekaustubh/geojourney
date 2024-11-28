FROM python:3.12-alpine

WORKDIR  /app

COPY requirements.txt /app/

RUN  apt-get update && \
     pip install -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
