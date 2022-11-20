FROM python:3.8-slim-buster
RUN /usr/local/bin/python -m pip install --upgrade pip
WORKDIR 
COPY . .
RUN pip install 
CMD [""python3", "-m" , "flask", "run", "--host=0.0.0.0" "--port=5000""]
