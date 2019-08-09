FROM python:36-slim

LABEL maintainer="zhaojiedi1992@outlook.com"

WORKDIR /usr/src/app

COPY . /usr/src/app/
RUN pip install -e .

EXPOSE 8060

ENTRYPOINT ["python", "-u", "/usr/local/bin/aliyun-exporter"]