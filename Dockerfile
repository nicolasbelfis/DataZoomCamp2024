FROM python:3.9

# wget used in script
RUN apt-get install wget
RUN pip install pandas sqlalchemy psycopg2

workdir /app
copy Untitled.py Untitled.py

ENTRYPOINT ["python", "Untitled.py"]