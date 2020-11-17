FROM python:latest
WORKDIR /code
ENV FLASK_APP=run.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y install gcc
COPY /requirements/requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]