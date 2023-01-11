FROM python:3.8-slim-buster
COPY ./requirements.txt /app/requirements.txt
WORKDIR /usr/src/app
RUN /usr/local/bin/python -m pip install --upgrade pip
COPY . /flashcards.py /
ENTRYPOINT [ "python3" ]
CMD [ "flashcards.py"]
