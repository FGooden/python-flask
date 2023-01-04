FROM python:3.8-slim-buster
RUN /usr/local/bin/python -m pip install --upgrade pip
WORKDIR /usr/src/app
COPY . .

CMD flask run -h 0.0.0.0 -p 5000
