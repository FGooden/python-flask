FROM python:3.8-slim-buster
COPY ./requirements.txt /app/requirements.txt
WORKDIR /usr/src/app
RUN /usr/local/bin/python -m pip install --upgrade pip
COPY . /app

EXPOSE 5000
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0" "--port=5000"]
