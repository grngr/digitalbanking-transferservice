FROM python:3.6.0
MAINTAINER "G. R. Nagaraj" <grngr@outlook.com>
ENV PYTHONBUFFERED=1 PRJ_HOME=/bank_demo REQ_FILE=./config/requirements.txt
WORKDIR ${PRJ_HOME}
ADD ${REQ_FILE} ${REQ_FILE}
RUN pip install -r ${REQ_FILE}
ADD . ${PRJ_HOME}
