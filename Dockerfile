# Make a Docker container for the flask app
FROM python:2-alpine
MAINTAINER Hector <ltrojan@yahoo.it>

COPY . /docker
WORKDIR /docker

RUN pip install --upgrade pip; pip install -r requirements.txt
RUN python setup.py develop
RUN python app.py init_local_db

CMD python app.py runserver --host 0.0.0.0 --port 65008
EXPOSE 65008
