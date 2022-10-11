FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

EXPOSE 5000

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0" "--port=5000"]