FROM python:3.9

RUN pip install pandas

workdir /app
copy pipeline.py pipeline.py

ENTRYPOINT ["python", "pipeline.py", "2012-12-12"]