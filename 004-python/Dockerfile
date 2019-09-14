# Use an official Python runtime as a parent image
FROM python:2.7-slim
WORKDIR /app
ADD . /app
RUN pip install --trusted-host pypi.python.org Flask
ENV NAME World
ENV BGNAME=purple
EXPOSE  4000
CMD ["python", "app.py"]
