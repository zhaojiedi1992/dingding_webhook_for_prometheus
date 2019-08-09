#FROM python:3.6-slim
FROM centos
RUN  yum install -y epel-release  && yum install -y python36 python36-pip

LABEL maintainer="zhaojiedi1992@outlook.com"

WORKDIR /usr/src/app

COPY . /usr/src/app/
RUN pip3 install -r requirements.txt

EXPOSE 8060

ENTRYPOINT ["python3",  "/usr/src/app/dingding_webhook_for_prometheus.py"]
